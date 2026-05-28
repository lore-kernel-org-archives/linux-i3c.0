Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9F0CD5BD5
	for <linux-i3c@archiver.kernel.org>; Thu, 28 May 2026 08:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JB1yHTR1LfP8IeYna6lwc08f065yxDmoje8E3jWEfPE=; b=KDhsglFWUdvXnP
	wHLR6zzAaZ9KzCYxjkoD0nsueEXVe1ZkaGEWAZOTcO+IxkXkuS8Oyx8T2/4pGuxrvXCyNLw68Mt3r
	xl4H9zOKD42AXkdpTI5NDOfp4OsKmGuntmmZ7wLO8mGZudZZe/Q0o3QZShnU3W4zU2gyDdRgrgd3N
	PXNAA8IMHjWKVFYsYxRmr0frO8p4NCjTH33olUA5Ahapv2m/uek+BsX/uBYwgzWoVcpTK4ImzpobD
	nV45xoLeeGp6fo+LciUmDikly9CGeRB7iRSzZuiuD9EuDlkGSHSQ2VaAoh0uvlVCFkKmcHjNrW2Ns
	WwgRAquRl3ICYCdr56kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSW7l-00000005O7r-3jXv;
	Thu, 28 May 2026 08:29:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSW7j-00000005O7Q-3NaE
	for linux-i3c@lists.infradead.org;
	Thu, 28 May 2026 08:29:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F252A60601;
	Thu, 28 May 2026 08:29:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4767A1F00A3A;
	Thu, 28 May 2026 08:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779956990;
	bh=e+d+mPKVJtuyhvoelHxJWZa6tDGCQO++RJc+s3Av7ws=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=A8EUTL3rvw6qP7SzzK9AGJw97EWgDbIh586kp9h8O6HzTwLLDgkjA+9rlVi01hNqZ
	 8UATqGu9KQbCI7qxlWYo4/9Q1BlghOf8IXR+DNO1SwbT5+PapFdd047vIqY5r/8H4E
	 So/E30ZseiHz1ULXGZtRffdpMFMS2NVIO5QKDUgW7FYnJmsxlC00x6K1BbKIh+Ukm7
	 uZWp3HHdDGqCnlfE9AdB8HN0upM/6H0YYbmpOG+nwFDH/gpTxAPuMwiQr76ZI6+Jvq
	 t1kVqf/socThqG1lWXf2Qhu0YkB3Q31F+N0cj8h8ZT+3mynQT9aul5peJCoSgsU5EF
	 C0XegRq11a9Lw==
Message-ID: <560f3365-8a22-477b-ae3d-61e8f4103e83@kernel.org>
Date: Thu, 28 May 2026 11:29:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/17] i3c: renesas: Restore STDBR and EXTBR registers on
 resume
To: Frank Li <Frank.li@nxp.com>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
 alexandre.belloni@bootlin.com, p.zabel@pengutronix.de,
 claudiu.beznea@tuxon.dev, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
 <20260522101815.1722909-4-claudiu.beznea@kernel.org>
 <ahCqF-OHFbV9b5ul@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <ahCqF-OHFbV9b5ul@lizhi-Precision-Tower-5810>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

SGksIEZyYW5rLAoKT24gNS8yMi8yNiAyMjoxMCwgRnJhbmsgTGkgd3JvdGU6Cj4gT24gRnJpLCBN
YXkgMjIsIDIwMjYgYXQgMDE6MTg6MDFQTSArMDMwMCwgQ2xhdWRpdSBCZXpuZWEgd3JvdGU6Cj4+
IEZyb206IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5lYS51akBicC5yZW5lc2FzLmNvbT4K
Pj4KPj4gVGhlIFJlbmVzYXMgUlovRzNTIHN1cHBvcnRzIGEgcG93ZXIgc2F2aW5nIHN0YXRlIHdo
ZXJlIHBvd2VyIHRvIHRoZSBtb3N0Cj4+IFNvQyBjb21wb25lbnRlcyAoaW5jbHVkaW5nIEkzQykg
aXMgbG9zdC4KPj4KPj4gVGhlIFNUREJSIGFuZCBFWFRCUiBhcmUgY29uZmlndXJlZCBpbiBpbml0
aWFsaXphdGlvbiBwaGFzZSB0aG91Z2ggdGhlCj4+IHN0cnVjdCBpM2NfbWFzdGVyX2NvbnRyb2xs
ZXJfb3BzOjpidXNfaW5pdC4gU2V0IHRoZW0gb24gcmVzdW1lIGZ1bmN0aW9uCj4+IGFzIHdlbGwg
dG8ga2VlcCB0aGUgc2FtZSBzdGF0ZSBvZiB0aGUgY29udHJvbGxlciBhZnRlciBhIHN1c3BlbmQg
d2l0aAo+PiBwb3dlciBsb3NzIGFuZCBhIHNpbWlsYXIgaW5pdGlhbGl6YXRpb24gc2VxdWVuY2Ug
YXMgaW4gYnVzX2luaXQuCj4+Cj4+IEZpeGVzOiBlNzIxODk4NjMxOWIgKCJpM2M6IHJlbmVzYXM6
IEFkZCBzdXNwZW5kL3Jlc3VtZSBzdXBwb3J0IikKPj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5v
cmcKPj4gU2lnbmVkLW9mZi1ieTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhLnVqQGJw
LnJlbmVzYXMuY29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL2kzYy9tYXN0ZXIvcmVuZXNhcy1pM2Mu
YyB8IDEwICsrKysrKy0tLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyL3JlbmVz
YXMtaTNjLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvcmVuZXNhcy1pM2MuYwo+PiBpbmRleCAxOTE3
NTQ5Y2Y2ZDUuLjZjMjNmOTU2YWQyYSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVy
L3JlbmVzYXMtaTNjLmMKPj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL3JlbmVzYXMtaTNjLmMK
Pj4gQEAgLTI2MCw2ICsyNjAsNyBAQCBzdHJ1Y3QgcmVuZXNhc19pM2Mgewo+PiAgIAl1MzIgZHlu
X2FkZHI7Cj4+ICAgCXUzMiBpMmNfU1REQlI7Cj4+ICAgCXUzMiBpM2NfU1REQlI7Cj4+ICsJdTMy
IGV4dGJyOwo+IAo+IGNhbiB5b3Uga2VlcCBjb25zaXNlbnQgd2l0aCBhYm92ZSAyIHJlZ2lzdGVy
LCB1c2UgdXBjYXNlIEVYVEJSLAoKVXNpbmcgdXBwZXIgY2FzZSBmb3IgdGhpcyB3aWxsIG1pc2xl
YWQgdGhlIGNvbXBpbGVyLiBUaGVyZSBpcyBhbHJlYWR5IGEgbWFjcm8gCmRlZmluZWQgZm9yIEVY
VEJSOgoKI2RlZmluZSBFWFRCUiAgICAgICAgICAgICAgICAgICAweDc4CgpEZWZpbmluZyB0aGlz
IG1lbWJlciBhczoKCnUzMiBFWFRCUjsKCndpbGwgbWFrZSB0aGUgY29tcGlsZXIgdHJ5IHRvIHJl
cGxhY2UgdGhlIEVYVEJSIGluICJpM2MtPkVYVEJSIiBhdCBwcmVwcm9jZXNzaW5nIAp0aW1lOgoK
ICAgQ0MgW01dICBkcml2ZXJzL2kzYy9tYXN0ZXIvcmVuZXNhcy1pM2MubwouLi9kcml2ZXJzL2kz
Yy9tYXN0ZXIvcmVuZXNhcy1pM2MuYzo2NToxNzogZXJyb3I6IGV4cGVjdGVkIGlkZW50aWZpZXIg
b3Ig4oCYKOKAmSAKYmVmb3JlIG51bWVyaWMgY29uc3RhbnQKICAgIDY1IHwgI2RlZmluZSBFWFRC
UiAgIDB4NzgKICAgICAgIHwgICAgICAgICAgICAgICAgIF5+fn4KLi4vZHJpdmVycy9pM2MvbWFz
dGVyL3JlbmVzYXMtaTNjLmM6MjYzOjY6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhF
WFRCUuKAmQogICAyNjMgfCAgdTMyIEVYVEJSOwogICAgICAgfCAgICAgIF5+fn5+Ci4uL2RyaXZl
cnMvaTNjL21hc3Rlci9yZW5lc2FzLWkzYy5jOiBJbiBmdW5jdGlvbiDigJhyZW5lc2FzX2kzY19i
dXNfaW5pdOKAmToKLi4vZHJpdmVycy9pM2MvbWFzdGVyL3JlbmVzYXMtaTNjLmM6NjU6MTc6IGVy
cm9yOiBleHBlY3RlZCBpZGVudGlmaWVyIGJlZm9yZSAKbnVtZXJpYyBjb25zdGFudAogICAgNjUg
fCAjZGVmaW5lIEVYVEJSICAgMHg3OAogICAgICAgfCAgICAgICAgICAgICAgICAgXn5+fgouLi9k
cml2ZXJzL2kzYy9tYXN0ZXIvcmVuZXNhcy1pM2MuYzo2MTE6Nzogbm90ZTogaW4gZXhwYW5zaW9u
IG9mIG1hY3JvIOKAmEVYVEJS4oCZCiAgIDYxMSB8ICBpM2MtPkVYVEJSID0gRVhUQlJfRUJSTE8o
b2RfbG93X3RpY2tzKSB8IEVYVEJSX0VCUkhPKG9kX2hpZ2hfdGlja3MpIHwKICAgICAgIHwgICAg
ICAgXn5+fn4KLi4vZHJpdmVycy9pM2MvbWFzdGVyL3JlbmVzYXMtaTNjLmM6NjU6MTc6IGVycm9y
OiBleHBlY3RlZCBpZGVudGlmaWVyIGJlZm9yZSAKbnVtZXJpYyBjb25zdGFudAogICAgNjUgfCAj
ZGVmaW5lIEVYVEJSICAgMHg3OAogICAgICAgfCAgICAgICAgICAgICAgICAgXn5+fgouLi9kcml2
ZXJzL2kzYy9tYXN0ZXIvcmVuZXNhcy1pM2MuYzo2MTM6NDA6IG5vdGU6IGluIGV4cGFuc2lvbiBv
ZiBtYWNybyDigJhFWFRCUuKAmQogICA2MTMgfCAgcmVuZXNhc193cml0ZWwoaTNjLT5yZWdzLCBF
WFRCUiwgaTNjLT5FWFRCUik7CiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIF5+fn5+Ci4uL2RyaXZlcnMvaTNjL21hc3Rlci9yZW5lc2FzLWkzYy5jOiBJbiBm
dW5jdGlvbiDigJhyZW5lc2FzX2kzY19yZXN1bWVfbm9pcnHigJk6Ci4uL2RyaXZlcnMvaTNjL21h
c3Rlci9yZW5lc2FzLWkzYy5jOjY1OjE3OiBlcnJvcjogZXhwZWN0ZWQgaWRlbnRpZmllciBiZWZv
cmUgCm51bWVyaWMgY29uc3RhbnQKICAgIDY1IHwgI2RlZmluZSBFWFRCUiAgIDB4NzgKICAgICAg
IHwgICAgICAgICAgICAgICAgIF5+fn4KLi4vZHJpdmVycy9pM2MvbWFzdGVyL3JlbmVzYXMtaTNj
LmM6MTQ1MTo0MDogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmEVYVEJS4oCZCiAgMTQ1
MSB8ICByZW5lc2FzX3dyaXRlbChpM2MtPnJlZ3MsIEVYVEJSLCBpM2MtPkVYVEJSKTsKICAgICAg
IHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn4KClRoZSByZWdp
c3RlciBjb250YWlucyBib3RoIGkzYyBhbmQgaTJjIHNwZWNpZmljIGZpZWxkcy4gSSdtIG5vdCBz
dXJlIHVzaW5nIAppMmNfaTNjX0VYVEJSIGlzIHRoZSBiZXN0IHdheSB0byBnbyBmb3J3YXJkIGZv
ciB0aGlzIG9yIGp1c3Qga2VlcGluZyBpdCBhcyBpcy4KCi0tIApUaGFuayB5b3UsCkNsYXVkaXUK
CgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
