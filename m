Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36A7C9832A
	for <linux-i3c@archiver.kernel.org>; Tue, 29 Sep 2026 06:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GnV2XwBsRIiQrBi8tc3qPq3qb9eCm0WL2pVfz691h8w=; b=lX3tQueBT6nC1Q
	o8Ao5FhZiN/STXuf3NFujfbrc7pgzTDONoeMR1gZB0SsCNu9giAD9JFlcTvxFLTKvsvJ+jme9drzL
	723zebaqSks7/RNOqk+ld4HCwsEUuiuxuqaoO4/HoYQRHu7l2lhEDyGx6l6Pwv+ylSU8a0fCoSylT
	lLjzmeWi88K3t2VAjj8XECSNL2iRoIGfmRplRm2Dr5mkqvGHwt4jTB1+0KhThAoZHewetOJVIjFOp
	3yqRhzd2MesWq6PDbx91T81c0xDjt0DbqnDF34xc2ax8v1eil2ZaSMxTI5lc3S67DgYl36zOmzu+Q
	ahIWW7Y826X4sqVwFn9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRZt-00000002WI2-1iLX;
	Tue, 29 Sep 2026 06:44:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRZs-00000002WHw-1Y1c
	for linux-i3c@lists.infradead.org;
	Tue, 29 Sep 2026 06:44:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CCB4D60A59;
	Tue, 29 Sep 2026 06:44:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10DAE1F000FF;
	Tue, 29 Sep 2026 06:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790664275;
	bh=bJ+oJ7wH7njA5atKm2+mCrcTSv2vUPMgXS9P3JY+aHk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=axtpkRUeU2ceMjIqZRo/che0zuUvdIc+UKf27yA4lNTAvIJb4UGtSvFaTfZgB0PQx
	 9QC0rG7uv8lCPI3PqO1sfhINTGNkwexx0hD23aXNGcVQZNab5O/P9UZEsvhRCrh/mh
	 jJGie8KuGZ1wxsxxA4WcozQ6GHW+a5H6wNBQ/H5dr3vx5TnG7oFtk3xkrS2prx2Oc1
	 pBHIxife/gxTY5e/AGLW4aVIYOrexKGC7eg7GLlO/WgaPzPbkCwnFv3lsy/YfOqd+D
	 6RA/P4PzQ7mS0RLNIgMK6vcbyE3XoRoRMnrLxmkvO0mNGj8JQhtZ1LMHQhTRwcfcbW
	 QkpJpM7LTox0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 15/20] dt-bindings: clock: add Synaptics SL261X clock
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-serial@vger.kernel.org, linux-clk@vger.kernel.org, lee@kernel.org, robh@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-i3c@lists.infradead.org, conor+dt@kernel.org
In-Reply-To: <20260929061417.20733-16-jszhang@kernel.org>
References: <20260929061417.20733-1-jszhang@kernel.org>
 <20260929061417.20733-16-jszhang@kernel.org>
Date: Tue, 29 Sep 2026 06:44:34 +0000
Message-Id: <20260929064435.10DAE1F000FF@smtp.kernel.org>
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
NCBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gZHQtYmluZGluZ3M6
IGNsb2NrOiBzY2hlbWEgZXJyb25lb3VzbHkgbWF0Y2hlcyBnZW5lcmljIHN5c2NvbiBnbG9iYWxs
eQotIFtNZWRpdW1dIGR0LWJpbmRpbmdzOiBjbG9jazogbWlzc2luZyBjbG9jay1jZWxscyBpbiBy
ZXF1aXJlZCBwcm9wZXJ0aWVzCi0gW01lZGl1bV0gZHQtYmluZGluZ3M6IGNsb2NrOiBtaXNzaW5n
IGNsb2NrIElEcyBmb3IgQUlPIGNsb2NrIGNvbnRyb2xsZXIKLSBbTG93XSBkdC1iaW5kaW5nczog
Y2xvY2s6IG1pc3NpbmcgaW5jbHVkZSBndWFyZCBpbiBoZWFkZXIgZmlsZQotLQoKY29tbWl0IGU3
ZjhhM2I5MTQ4ODc5YjYzZTM1NGZkN2QxZDUxYWUwZWMyZGY5ZDAKQXV0aG9yOiBKaXNoZW5nIFpo
YW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+CgpkdC1iaW5kaW5nczogY2xvY2s6IGFkZCBTeW5hcHRp
Y3MgU0wyNjFYIGNsb2NrCgpBZGQgc3VwcG9ydCBmb3IgY2xvY2tzLCBwbGxzIGluIFN5bmFwdGlj
cyBTTDI2MVggU29Dcy4KCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9jbG9jay9zeW5hLHNsMjYxeC1jbGsueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9jbG9jay9zeW5hLHNsMjYxeC1jbGsueWFtbAo+IG5ldyBmaWxlIG1vZGUg
MTAwNzU1Cj4gaW5kZXggMDAwMDAwMDAwMDAwMC4uM2ZkMzgwYzFkZDM5ZAo+IC0tLSAvZGV2L251
bGwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svc3luYSxz
bDI2MXgtY2xrLnlhbWwKPiBAQCAtMCwwICsxLDkyIEBACgpbIC4uLiBdCgo+ICtwcm9wZXJ0aWVz
Ogo+ICsgIGNvbXBhdGlibGU6Cj4gKyAgICBvbmVPZjoKPiArICAgICAgLSBlbnVtOgo+ICsgICAg
ICAgICAgLSBzeW5hLHNsMjYxeC1zb2MtY2xrCj4gKyAgICAgICAgICAtIHN5bmEsc2wyNjF4LWNw
dS1jbGsKPiArICAgICAgICAgIC0gc3luYSxzbDI2MXgtYWlvLWNsawo+ICsgICAgICAgICAgLSBz
eW5hLHNsMjYxeC1zeXN0ZW0tY2xrCj4gKyAgICAgIC0gaXRlbXM6Cj4gKyAgICAgICAgICAtIGNv
bnN0OiBzaW1wbGUtbWZkCj4gKyAgICAgICAgICAtIGNvbnN0OiBzeXNjb24KCltTZXZlcml0eTog
TWVkaXVtXQpXaWxsIGRlZmluaW5nIHRoZXNlIGdlbmVyaWMgc3RyaW5ncyBhcyB2YWxpZCBtYXRj
aGVzIGNhdXNlIHRoZSBzY2hlbWEKdG9vbGNoYWluIHRvIGltcHJvcGVybHkgc2VsZWN0IGFuZCBh
cHBseSB0aGlzIGhpZ2hseSByZXN0cmljdGl2ZSBjbG9jawpzY2hlbWEgdG8gYWxsIHN5c2NvbiBu
b2RlcyBzeXN0ZW0td2lkZT8KCj4gKwo+ICsgIHJlZzoKPiArICAgIG1heEl0ZW1zOiAxCgpbIC4u
LiBdCgo+ICsgICcjY2xvY2stY2VsbHMnOgo+ICsgICAgY29uc3Q6IDEKPiArCj4gKyAgY2xvY2tz
Ogo+ICsgICAgbWF4SXRlbXM6IDEKPiArICAgIGRlc2NyaXB0aW9uOiBSZWZlcmVuY2UgY2xvY2sg
dXNlZCBhcyB0aGUgaW5wdXQgdG8gdGhlIFBMTHMuCj4gKwo+ICtyZXF1aXJlZDoKPiArICAtIGNv
bXBhdGlibGUKCltTZXZlcml0eTogTWVkaXVtXQpTaG91bGQgJyNjbG9jay1jZWxscycgYmUgZXhw
bGljaXRseSBpbmNsdWRlZCBpbiB0aGlzIHJlcXVpcmVkIGxpc3QgdG8KZW5mb3JjZSB0aGF0IHRo
ZXNlIG5vZGVzIGFjdCBhcyB2YWxpZCBjbG9jayBwcm92aWRlcnM/Cgo+ICsKPiArYWxsT2Y6Cgpb
IC4uLiBdCgo+ICsgICAgZWxzZToKPiArICAgICAgcHJvcGVydGllczoKPiArICAgICAgICBzeW5h
LGdibC1zeXNjb246IGZhbHNlCj4gKwo+ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKCltT
ZXZlcml0eTogTWVkaXVtXQpXaGVuIGFwcGxpZWQgdG8gYSBnZW5lcmljIHNpbXBsZS1tZmQgb3Ig
c3lzY29uIG5vZGUgc3lzdGVtLXdpZGUsIHdpbGwgdGhpcwpzdHJpY3QgY29uc3RyYWludCBpbmNv
cnJlY3RseSByZWplY3QgdmFsaWQgcHJvcGVydGllcyBhbmQgY2hpbGQgbm9kZXM/CgpbIC4uLiBd
Cgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL3N5bmEsc2wyNjF4Lmgg
Yi9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL3N5bmEsc2wyNjF4LmgKPiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMDAuLjQ2NDliMjMzZjA4YTUKPiAtLS0gL2Rldi9u
dWxsCj4gKysrIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9zeW5hLHNsMjYxeC5oCj4gQEAg
LTAsMCArMSwxMzEgQEAKPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wIE9S
IE1JVCkgKi8KPiArLyoKPiArICogU3luYXB0aWNzIFNMMjYxWCBjbG9jayB0cmVlIElEcwo+ICsg
Kgo+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjUgU3luYXB0aWNzIEluY29ycG9yYXRlZAo+ICsgKgo+
ICsgKiBBdXRob3I6IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4KPiArICovCgpb
U2V2ZXJpdHk6IExvd10KRG9lcyB0aGlzIGZpbGUgbmVlZCBhIHN0YW5kYXJkIGluY2x1ZGUgZ3Vh
cmQgKGUuZy4sCiNpZm5kZWYgX0RUX0JJTkRJTkdTX0NMT0NLX1NZTkFfU0wyNjFYX0gpIHRvIHBy
ZXZlbnQgbWFjcm8gcmVkZWZpbml0aW9uCndhcm5pbmdzIGFuZCBjb21waWxhdGlvbiBlcnJvcnMg
aWYgaW5jbHVkZWQgbXVsdGlwbGUgdGltZXM/Cgo+ICsKPiArLyogU29DIGRvbWFpbiAqLwo+ICsK
PiArLyogR0JMIGNvbW1vbiBjbGtzICovCj4gKyNkZWZpbmUgQ0xLX0NQVUZBU1RSRUYJCTAKCltT
ZXZlcml0eTogTWVkaXVtXQpUaGUgaGVhZGVyIGV4cGxpY2l0bHkgbWFwcyBkb21haW5zIGxpa2Ug
U29DLCBDUFUsIGFuZCBzeXNtZ3IsIGJ1dCBsYWNrcyBhCm1hY3JvIHNlY3Rpb24gZGVmaW5pbmcg
SURzIGZvciB0aGUgQUlPIGNsb2NrIGNvbnRyb2xsZXIuCgpTaW5jZSB0aGUgc2NoZW1hIGRlY2xh
cmVzIHRoZSBBSU8gY2xvY2sgY29udHJvbGxlciAoY29tcGF0aWJsZSA9CiJzeW5hLHNsMjYxeC1h
aW8tY2xrIikgYW5kIHJlcXVpcmVzICcjY2xvY2stY2VsbHMgPSA8MT4nLCBkZXZpY2UgdHJlZQph
dXRob3JzIG5lZWQgdmFsaWQgSURzIHRvIGNvbnN1bWUgaXRzIGNsb2Nrcy4KCkFyZSB0aGVyZSBt
aXNzaW5nIGNsb2NrIElEcyBmb3IgdGhlIEFJTyBjbG9jayBjb250cm9sbGVyPwoKLS0gClNhc2hp
a28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDkyOTA2
MTQxNy4yMDczMy0xLWpzemhhbmdAa2VybmVsLm9yZz9wYXJ0PTE1CgotLSAKbGludXgtaTNjIG1h
aWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
