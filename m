Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97C7C531DC
	for <linux-i3c@archiver.kernel.org>; Fri, 23 Aug 2024 16:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vW067G04gZNDBtgPnI58Sc4N7fxzv2kkM6SY14eJf1k=; b=wvqigt+88L8sJ4
	my5b9kM49BPiMDQwSKTAZ+faHZ8i1kFKyMdcZOaMEGgGnljig3sTCZzwmeqEIKDu/eVSE0580aM0F
	EofYDaRIytv8T3EnrW0P4iZZckWfu+ir0fH93ClKJucxgqhKPehd3bkYFYCGP8JZagY/lbBYiQhDR
	3v+RYeW3ru0dsGTrSLGPdDn8DcxZ4D8/7Y5NuwBdzqIbh7Hhpgvl0exJVn5fSSb11OrsCmJA+Wu6d
	NMNKvR+Uh/HvvaUxkQI7eUxPfoIqiJHZ4mM6PblV4i1ygNc/P7AYCvodNTfFJwRVd4RE0wkUK6zZI
	TliQUzo15nxdXMxtEM1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shX27-0000000HX0F-23Md;
	Fri, 23 Aug 2024 16:21:03 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shX0c-0000000HWbr-2Ykr
	for linux-i3c@lists.infradead.org;
	Fri, 23 Aug 2024 16:19:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DDA2F20003;
	Fri, 23 Aug 2024 16:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724429968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dGoYbKzQa3GXqZypdwCwdebcsHe5jiKHQseAXFC7eXA=;
	b=Ce/wQMO2CzuqN1Dc8v4VbnCV0r4T7/QWH7RsVeZUsdzvKgXpc4PlA027pYZ7uTOGQT2jSB
	c0Ma/QM87/jNcTN+2Lv3le8a3qzHTC/PS0ZmmE+Xi3WRJL3gIIMepAE1V5boJd0+Xd8+Ra
	x2HifcNejGNRn8+nAV4P7nQhMG3rObXBdOcxKo1IENnpcX08lWnUGW1pUBHi7REDjmWoIj
	uluPSUS74agLT93+u3XQPnGTowm8X+WYKOOjMIjZoZ+Z+XUsEOBFY05rcjZonHoZq09vhj
	EsmYTeHXehCvZBLzaUkMttE+0D0BV21gzcJUieIqkH+sd5IfdnfosZKjgBYNWw==
Date: Fri, 23 Aug 2024 18:19:27 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Parshuram Thombare <pthombar@cadence.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Boris Brezillon
 <bbrezillon@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Conor Culhane
 <conor.culhane@silvaco.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v3 09/11] i3c: master: svc: use spinlock_saveirq at
 svc_i3c_master_ibi_work()
Message-ID: <20240823181927.7a003c36@xps-13>
In-Reply-To: <20240819-i3c_fix-v3-9-7d69f7b0a05e@nxp.com>
References: <20240819-i3c_fix-v3-0-7d69f7b0a05e@nxp.com>
	<20240819-i3c_fix-v3-9-7d69f7b0a05e@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_091931_162424_6417CC37 
X-CRM114-Status: GOOD (  19.80  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIE1vbiwgMTkgQXVnIDIwMjQgMTI6
MDI6MDMgLTA0MDA6Cgo+IEFjY29yZGluZyB0byBJM0Mgc3BlYyB2ZXIgMS4xLCAwOS1KdW4tMjAy
MSwgc2VjdGlvbiA1LjEuMi41Ogo+IAo+IFRoZSBJM0MgQ29udHJvbGxlciBzaGFsbCBob2xkIFND
TCBMb3cgd2hpbGUgdGhlIEJ1cyBpcyBpbiBJM0MvSTJDIFRyYW5zZmVyLAoKCQkJCSAgICBsb3cJ
CQkJICAgIHRyYW5zZmVyCgo+IEFDSy9OQUNLIFBoYXNlLiBCdXQgbWF4aW11bSBzdGFsbCB0aW1l
IGlzIDEwMHVzLiBXZSBoYXZlIHRvIGRpc2FibGUgaXJxIGFuZAoKYW5kL29yIChJJ20gbm90IHN1
cmUpCQkJCXRoZSBJUlFzCgo+IHNjaGVkdWxlIGR1cmluZyB3aG9sZSBJM0MgdHJhbnNhY3Rpb24s
IG90aGVyd2lzZSwgSTNDIGJ1cyB0aW1lb3V0IHdpbGwKCnByZXZuZXQgc2NoZWR1bGluZyBkdXJp
bmcgdGhlIHdob2xlIAkJdGhlICAgICAgbWF5CnRpbWVvdXQuCgo+IGhhcHBlbiBpZiBhbnkgaXJx
IG9yIHNjaGVkdWxlIGhhcHBlbiBkdXJpbmcgdHJhbnNhY3Rpb24uCj4gCj4gUmVwbGFjZSBtdXRl
eCB3aXRoIHNwaW5sb2NrX3NhdmVpcnEoKSB0byBtYWtlIHN1cmUgZmluaXNoIHdob2xlIGkzYwoK
CQkJd3JvbmcgbmFtZQl0byBhdm9pZCBzdGFsbGluZyBTQ0wuLi4KCj4gdHJhbnNhY3Rpb24gd2l0
aG91dCBzdGFsbCBTQ0wgbW9yZSB0aGFuIDEwMHVzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEZyYW5r
IExpIDxGcmFuay5MaUBueHAuY29tPgoKWWVzLCAxMDB1cyBpcyBsb3csIGFuZCB0aGF0J3Mgd2h5
IEkgaW5pdGlhbGx5IGRpZCBteSBiZXN0IHRvIGVuZm9yY2UKYXV0byBhY2svbmFjay4gV2UgY2Fu
bm90IG1ha2Ugc3VyZSB0aGlzIGxpbWl0IHdpbGwgbm90IGJlIGNyb3NzZWQsIGFuZAp3aGVuIGl0
J3MgdGhlIGNhc2UsIHdlIG5lZWQgdG8gaGFuZGxlIHRoZSBjb25zZXF1ZW5jZXMuCgo+IC0tLQo+
ICBkcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYyB8IDE0ICsrKysrKysrKysrLS0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYyBiL2RyaXZl
cnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jCj4gaW5kZXggMTYxY2NkODI0NDQzYi4uZmJi
NmNlZjQwNTU3NyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0
ZXIuYwo+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jCj4gQEAgLTQz
Miw3ICs0MzIsMTYgQEAgc3RhdGljIHZvaWQgc3ZjX2kzY19tYXN0ZXJfaWJpX3dvcmsoc3RydWN0
IHdvcmtfc3RydWN0ICp3b3JrKQo+ICAJdTMyIHN0YXR1cywgdmFsOwo+ICAJaW50IHJldDsKPiAg
Cj4gLQltdXRleF9sb2NrKCZtYXN0ZXItPmxvY2spOwoKRG9uJ3QgeW91IHN0aWxsIG5lZWQgdGhp
cyBsb2NrIGZvciBvdGhlciBjb25jdXJyZW5jeSByZWFzb25zPwoKPiArCS8qCj4gKwkgKiBBY2Nv
cmRpbmcgdG8gSTNDIHNwZWMgdmVyIDEuMSwgMDktSnVuLTIwMjEsIHNlY3Rpb24gNS4xLjIuNToK
PiArCSAqCj4gKwkgKiBUaGUgSTNDIENvbnRyb2xsZXIgc2hhbGwgaG9sZCBTQ0wgTG93IHdoaWxl
IHRoZSBCdXMgaXMgaW4gSTNDL0kyQyBUcmFuc2ZlciwgQUNLL05BQ0sKPiArCSAqIFBoYXNlLiBC
dXQgbWF4aW11bSBzdGFsbCB0aW1lIGlzIDEwMHVzLiBXZSBoYXZlIHRvIGRpc2FibGUgaXJxIGFu
ZCBzY2hlZHVsZSBkdXJpbmcgd2hvbGUKPiArCSAqIEkzQyB0cmFuc2FjdGlvbiwgb3RoZXJ3aXNl
LCBJM0MgYnVzIHRpbWVvdXQgd2lsbCBoYXBwZW4gaWYgYW55IGlycSBvciBzY2hlZHVsZSBoYXBw
ZW4KPiArCSAqIGJldHdlZW4gdHJhbnNhY3Rpb24uLgo+ICsJICovCj4gKwlndWFyZChzcGlubG9j
a19pcnFzYXZlKSgmbWFzdGVyLT54ZmVycXVldWUubG9jayk7Cj4gKwo+ICAJLyoKPiAgCSAqIElC
SVdPTiBtYXkgYmUgc2V0IGJlZm9yZSBTVkNfSTNDX01DVFJMX1JFUVVFU1RfQVVUT19JQkksIGNh
dXNpbmcKPiAgCSAqIHJlYWRsX3JlbGF4ZWRfcG9sbF90aW1lb3V0KCkgdG8gcmV0dXJuIGltbWVk
aWF0ZWx5LiBDb25zZXF1ZW50bHksCj4gQEAgLTQ1Miw3ICs0NjEsNyBAQCBzdGF0aWMgdm9pZCBz
dmNfaTNjX21hc3Rlcl9pYmlfd29yayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCj4gIAkgICAg
ICAgbWFzdGVyLT5yZWdzICsgU1ZDX0kzQ19NQ1RSTCk7Cj4gIAo+ICAJLyogV2FpdCBmb3IgSUJJ
V09OLCBzaG91bGQgdGFrZSBhcHByb3hpbWF0ZWx5IDEwMHVzICovCj4gLQlyZXQgPSByZWFkbF9y
ZWxheGVkX3BvbGxfdGltZW91dChtYXN0ZXItPnJlZ3MgKyBTVkNfSTNDX01TVEFUVVMsIHZhbCwK
PiArCXJldCA9IHJlYWRsX3JlbGF4ZWRfcG9sbF90aW1lb3V0X2F0b21pYyhtYXN0ZXItPnJlZ3Mg
KyBTVkNfSTNDX01TVEFUVVMsIHZhbCwKPiAgCQkJCQkgU1ZDX0kzQ19NU1RBVFVTX0lCSVdPTih2
YWwpLCAwLCAxMDAwKTsKClRoaXMgbWVhbnMgeW91IGxvY2sgb25lIENQVSBmb3IgMTAwdXMgZG9p
bmcgbm90aGluZyBldmVyeSB0aW1lIHlvdSBzZW5kCmEgZnJhbWUsIHRoYXQncyBub3QgcG9zc2li
bGUuIEFjdHVhbGx5IHRoZSBkZWxheSB3YXMgYWxyZWFkeSB2ZXJ5IHNtYWxsCihjb3VsZCBoYXZl
IGJlZW4gc2V0IHRvIH4xMCBtYXliZSkgYnV0IHRoaXMgaXMgbm90IHBvc3NpYmxlLgoKPiAgCWlm
IChyZXQpIHsKPiAgCQlkZXZfZXJyKG1hc3Rlci0+ZGV2LCAiVGltZW91dCB3aGVuIHBvbGxpbmcg
Zm9yIElCSVdPTlxuIik7Cj4gQEAgLTUyNSw3ICs1MzQsNiBAQCBzdGF0aWMgdm9pZCBzdmNfaTNj
X21hc3Rlcl9pYmlfd29yayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCj4gIAo+ICByZWVuYWJs
ZV9pYmlzOgo+ICAJc3ZjX2kzY19tYXN0ZXJfZW5hYmxlX2ludGVycnVwdHMobWFzdGVyLCBTVkNf
STNDX01JTlRfU0xWU1RBUlQpOwo+IC0JbXV0ZXhfdW5sb2NrKCZtYXN0ZXItPmxvY2spOwo+ICB9
Cj4gIAo+ICBzdGF0aWMgaXJxcmV0dXJuX3Qgc3ZjX2kzY19tYXN0ZXJfaXJxX2hhbmRsZXIoaW50
IGlycSwgdm9pZCAqZGV2X2lkKQo+IAoKClRoYW5rcywKTWlxdcOobAoKLS0gCmxpbnV4LWkzYyBt
YWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
