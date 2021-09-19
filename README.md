<h1>sirubo</h1>
<p style="line-height: 165%;">ASN prefix (big tech conglomerate) outbound traffic blocker.</p>

<br>
<h3>Usage</h3>

<code>sirubo [argument]</code>
<br>

<ol>
<table style="width: 100%;">
<tr>
	<td><code>create</code></td>
	<td>Generate new firewall ruleset and login service.</td>
</tr>
<tr>
	<td><code>list</code></td>
	<td>Display existing firewall ruleset.</td>
</tr>
<tr>
	<td><code>resume</code></td>
	<td>Resume enforcement of existing firewall ruleset and enable login service.</td>
</tr>
<tr>
	<td><code>stop</code></td>
	<td>Disable existing firewall ruleset and login service.</td>
</tr>
</table>
</ol>

<br>
<h3>Purpose</h3>

<p>
Preventing passive and nonconsensual telemetry, and the infringement of one's privacy thereafter, from impertinently inquisitive big tech conglomerates, such as Facebook and Alphabet (Google).
</p>

<br>
<h3>Name Origin</h3>
<p>
Dissecting the etymology of sirubo (<i>pronounced as <u>seer-rue-bow</u></i>), "<b>si</b>" refers to the silicon chemical symbol (Si), which is in reference to <b>Silicon Valley</b>. "<b>rubo</b>" is a word of the universal auxiliary language of <a href="https://wikipedia.org/wiki/Esperanto">Esperanto</a>, meaning "<b>trash</b>" or "<b>garbage</b>".
</p>

<br>
<h3>Requirements</h3>
<table style="max-width: 75%; text-align: left; border: 1px solid black; padding: 10px;">
<tr>
	<th style="padding-bottom: 10px; padding-right: 10px; border-bottom: 1px solid black;">OpenBSD</th>
	<th style="padding-bottom: 10px; border-bottom: 1px solid black;">Linux</th>
</tr>
<tr>
	<td style="padding-top: 10px;"><code>pf</code></td>
	<td style="padding-top: 10px;"><code>nftables</code></td>
</tr>
<tr>
	<td><code>whois</code></td>
	<td><code>systemd</code></td>
</tr>
<tr>
	<td><code></code></td>
	<td><code>whois</code></td>
</tr>
</table>

<br>
<h3>Installing</h3>
<ol>
<li>Install sirubo and create a configuration file:</li>

<pre>
sudo make
</pre>

<li>Open the configuration file:</li>

<pre>
sudo $editor_of_choice /usr/local/etc/sirubo.conf
</pre>

<p>And add at least one ASN. Ensure ASNs are listed in this fashion:</p>

<pre>
AS15169
AS32934
AS8075
</pre>

<li>Generate a new firewall ruleset:</li>

<pre>
sudo sirubo create
</pre>

<p>In addition, a login service will be created, enabling ruleset persistency and automatic ruleset updates upon system reboots.</p>

<li>To test your new firewall ruleset, attempt to open a TCP connection with a domain name or IP address associated with a specified ASN:</li>

<pre>
nc -v example.com 443
</pre>

<p>Which should print output such as this:</p>

<pre>
nc: connect to example.com (0.0.0.0) port 443 (tcp) failed: Connection refused
</pre>

<p>This will indicate that your firewall is configured to reject outbound traffic to <code>example.com</code>.</p>
</ol>

<br>
<h3>Uninstalling</h3>
<ol>
<li>From its git repository, run the following to uninstall sirubo:

<pre>
make uninstall
</pre>

<p>Or run the following to uninstall sirubo and delete its configuration file:</p>

<pre>
make clean
</pre>
</ol>

<br>
<h3>Previews</h3>
<p>Refer to <code>preview</code> GIF files located within the <code>src/</code> directory for recorded examples of this project's use case.</p>

<br>
<h3>License</h3>

<p>Refer to the LICENSE file for details.
