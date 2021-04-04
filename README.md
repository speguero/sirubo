<h1>sirubo</h1>
<p style="line-height: 165%;">ASN IP (big tech conglomerate) outbound traffic blocker.</p>
<a href="https://peguero.xyz/project/sirubo">https://peguero.xyz/project/sirubo</a>

<br>
<h3>Usage</h3>

<code>sirubo [command]</code>
<br>

<ol>
<table style="width: 100%;">
<tr>
	<td><code>[none]</code></td>
	<td>Display help.</td>
</tr>
<tr>
	<td><code>help</code></td>
	<td>Display help.</td>
</tr>
<tr>
	<td><code>create</code></td>
	<td>Generate firewall reject rules.</td>
</tr>
<tr>
	<td><code>stop</code></td>
	<td>Undo firewall reject rules.</td>
</tr>
<tr>
	<td><code>resume</code></td>
	<td>Resume enforcement of cached firewall reject rules.</td>
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
Dissecting the admittedly deliberate etymology of <i>sirubo (pronounced as <u>seer-rue-bow</u>)</i>, <i>"si"</i> references silicon's chemical symbol, <b>Si</b>, which serves as a subtle reference to Silicon Valley thereafter. <i>"rubo"</i> is a word of the universal auxiliary language of <a href="https://wikipedia.org/wiki/Esperanto">Esperanto</a>, meaning <i>"trash"</i> or <i>"garbage."</i>
</p>

<br>
<h3>Requirements</h3>
<table style="max-width: 75%; text-align: left; border: 1px solid black; padding: 10px;">
<tr><th style="padding-bottom: 10px; border-bottom: 1px solid black;">Linux</th></tr>
<tr><td style="padding-top: 10px;"><code>nftables</code></td></tr>
<tr><td><code>systemd</code></td></tr>
<tr><td><code>whois</code></td></tr>
</table>

<br>
<h3>Installing</h3>
<ol>
<li>Install <i>sirubo</i> and its configuration file:</li>

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

<li>Create new firewall reject rules:</li>

<pre>
sudo sirubo create
</pre>

<li>Ping a domain name whose IP address is associated with a specified ASN and confirm the rejection of outbound ICMP packets:</li>

<pre>
ping -c 1 example.com
</pre>

<p>Which should print output such as this:</p>

<pre>
icmp_seq=1 Destination Port Unreachable
ping: sendmsg: Operation not permitted
1 packets transmitted, 0 received, +1 errors, 100% packet loss, time 0m
</pre>

<p>This will indicate that outbound traffic to <code>example.com</code> is being rejected.</p>

</ol>

<br>
<h3>Uninstalling</h3>

<ol>
<li>From its git repository, run the following to uninstall <i>sirubo</i>:

<pre>
make uninstall
</pre>

<p>Or run the following to uninstall <i>sirubo</i> and delete its configuration file:</p>

<pre>
make clean
</pre>
</ol>

<br>
<h3>License</h3>
<pre>
The MIT License (MIT)

Copyright © 2021 Steven Peguero

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
</pre>
