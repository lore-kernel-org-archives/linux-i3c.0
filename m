Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D90F8C43458
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Jul 2026 13:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MASZyFpaTB4RnP6Zi3SEPdXOlCoV4hdWCzY3DkpmjRQ=; b=qOr2Yw5tQrNUYZ
	2vkop968GuXUobtaz9qpB7P1M9z1k2isWQON6z6iKFq0R2S7cQhlwWKEgZrQltzrsawKRV+I+a1LX
	vftGDM4Yppc1kdlWMJ7UeHfaieds/9YjbByeQJw2VbVXrVTFt+H99vMHHUR/wlPkpSi+yvT54S6iZ
	GDlGozhf+gzGEdOIHN7irfxGSWed8CjHGQ7u4vy4nkV6pop3mHE0MzIK4Ubac/YXKaCkVxRkvhmU6
	piFC09yxgXCmAaWTWI8m/ECFm+Qc/A/g5bYHsxJVP72Wk9yo3MsxTLIhIzpHKjwZw6dxrHOUDh5eE
	S6tgzLQ9VBzr7GdTMm0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjH3L-00000009SHh-0GYI;
	Mon, 13 Jul 2026 13:50:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjH3J-00000009SHB-1gjz
	for linux-i3c@lists.infradead.org;
	Mon, 13 Jul 2026 13:50:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2F2DC4055C;
	Mon, 13 Jul 2026 13:50:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADFB41F00A3A;
	Mon, 13 Jul 2026 13:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783950633;
	bh=lvFY62UQzjqIjZvtjKoeZeUSz2Fqel8Iojr+gjHPuMk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OIrpCOm24dtXtgH1AjqAItoN5G1j3wwWhs4qp7PEV0NH33g/GSXX0U6wBfeUB0/mc
	 IrZffBGFuZ+B7zU3/ylawCUINqEzWGDmOivV03BoG7grrNvo2wi35HaEdAglEVjoMH
	 HvvK3ZqRjHSZ1AjBttaWZmVm/IBH9bZ6k+v3FFS4bmoVTXuKnRByhpBlcj9ycwU+ye
	 T2PIWjEv6sN5ubDmvZgxg1mgxd4yVjA08cPlMStosjMZ+6Y6obdlNWoNMUsuaPJVMj
	 3wF2Cr6R6ap9SxhQl3IEmJgXFw1c18XZzetfMibgM4FV/su25Hak4RbUTtB6ei1M9i
	 qQ/xHS0nTnmQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 06/17] i3c: renesas: Perform Dynamic Address
 Assignment on resume
To: "Claudiu Beznea" <claudiu.beznea@tuxon.dev>
Cc: linux-i3c@lists.infradead.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, wsa+renesas@sang-engineering.com, Frank.Li@kernel.org
In-Reply-To: <20260713130545.568657-7-claudiu.beznea+renesas@tuxon.dev>
References: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
 <20260713130545.568657-7-claudiu.beznea+renesas@tuxon.dev>
Date: Mon, 13 Jul 2026 13:50:32 +0000
Message-Id: <20260713135032.ADFB41F00A3A@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIFJlbW92YWwgb2YgdGhl
IERBVEJBU24gc2F2ZS9yZXN0b3JlIG1lY2hhbmlzbSBjb21wbGV0ZWx5IGJyZWFrcyB0aGUgSTND
IGJ1cyB1cG9uIHJlc3VtZSBmb3IgcHJldmlvdXNseSBhdHRhY2hlZCBkZXZpY2VzLCBhbmQgZmFp
bHMgdG8gcmVzdW1lIGlmIHRoZSBidXMgd2FzIGZ1bGx5IG9jY3VwaWVkLgotLQoKLS0tIFBhdGNo
IFs2XTogW1BBVENIIHY1IDA2LzE3XSBpM2M6IHJlbmVzYXM6IFBlcmZvcm0gRHluYW1pYyBBZGRy
ZXNzIEFzc2lnbm1lbnQgb24gcmVzdW1lIC0tLQpjb21taXQgZTRhYzgzOGMwNTVkYzMzYmViMmZm
NGU4OTY4YTAzMmRhNDhhMmE0NwpBdXRob3I6IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5l
YS51akBicC5yZW5lc2FzLmNvbT4KCmkzYzogcmVuZXNhczogUGVyZm9ybSBEeW5hbWljIEFkZHJl
c3MgQXNzaWdubWVudCBvbiByZXN1bWUKClRoaXMgY29tbWl0IHVwZGF0ZXMgdGhlIHN1c3BlbmQv
cmVzdW1lIG9wZXJhdGlvbnMgYnkgbW92aW5nIHRoZW0gb3V0IG9mCnRoZSBub2lycSBwaGFzZSBh
bmQgYXR0ZW1wdGluZyB0byBwZXJmb3JtIER5bmFtaWMgQWRkcmVzcyBBc3NpZ25tZW50IG9uCnJl
c3VtZS4gSXQgYWxzbyByZW1vdmVzIHRoZSBzYXZlIGFuZCByZXN0b3JlIG9mIHRoZSBEQVRCQVNu
IHJlZ2lzdGVycy4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci9yZW5lc2FzLWkz
Yy5jIGIvZHJpdmVycy9pM2MvbWFzdGVyL3JlbmVzYXMtaTNjLmMKPiAtLS0gYS9kcml2ZXJzL2kz
Yy9tYXN0ZXIvcmVuZXNhcy1pM2MuYwo+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci9yZW5lc2Fz
LWkzYy5jCgpbIC4uLiBdCgo+IEBAIC0xNDk1LDE1ICsxNDg0LDE5IEBAIHN0YXRpYyBpbnQgcmVu
ZXNhc19pM2NfcmVzdW1lX25vaXJxKHN0cnVjdCBkZXZpY2UgKmRldikKPiAgCXJlbmVzYXNfd3Jp
dGVsKGkzYy0+cmVncywgTVNEVkFELCBNU0RWQURfTURZQURWIHwKPiAgCQkgICAgICAgTVNEVkFE
X01EWUFEKGkzYy0+ZHluX2FkZHIpKTsKPiAgCj4gLQkvKiBSZXN0b3JlIERldmljZSBBZGRyZXNz
IFRhYmxlIHZhbHVlcy4gKi8KPiAtCWZvciAoaSA9IDA7IGkgPCBpM2MtPm1heGRldnM7IGkrKykK
PiAtCQlyZW5lc2FzX3dyaXRlbChpM2MtPnJlZ3MsIERBVEJBUyhpKSwgaTNjLT5EQVRCQVNuW2ld
KTsKPiAtCj4gIAkvKiBJM0MgaHcgaW5pdC4gKi8KPiAgCXJlbmVzYXNfaTNjX2h3X2luaXQoaTNj
KTsKPiAgCj4gKwlyZXQgPSBpM2NfbWFzdGVyX2RvX2RhYV9leHQoJmkzYy0+YmFzZSwgdHJ1ZSk7
CgpbU2V2ZXJpdHk6IEhpZ2hdCkRvZXMgcmVtb3ZpbmcgdGhlIERBVEJBU24gc2F2ZSBhbmQgcmVz
dG9yZSBtZWNoYW5pc20gYnJlYWsgY29tbXVuaWNhdGlvbgp3aXRoIHByZXZpb3VzbHkgYXR0YWNo
ZWQgZGV2aWNlcyB1cG9uIHJlc3VtZT8KCkxvb2tpbmcgYXQgcmVuZXNhc19pM2NfZGFhKCksIGl0
IGV4cGxpY2l0bHkgc2tpcHMgaGFyZHdhcmUgcmVnaXN0ZXIKaW5pdGlhbGl6YXRpb24gZm9yIHBy
ZXZpb3VzbHkgYXR0YWNoZWQgZGV2aWNlczoKCnJlbmVzYXNfaTNjX2RhYSgpIHsKICAgICAgICAu
Li4KICAgICAgICBpZiAob2xkZGV2cyAmIEJJVChwb3MpKQogICAgICAgICAgICAgICAgY29udGlu
dWU7CiAgICAgICAgLi4uCn0KClNpbmNlIHRoZSBjb250cm9sbGVyIHdhcyByZXNldCBkdXJpbmcg
c3VzcGVuZCwgd29uJ3QgdGhlc2UgaGFyZHdhcmUKcmVnaXN0ZXJzIHJlbWFpbiB1bmluaXRpYWxp
emVkICgwKSBpZiBEQVRCQVNuIGlzbid0IG1hbnVhbGx5IHJlc3RvcmVkIGhlcmU/CgpBZGRpdGlv
bmFsbHksIGlmIHRoZSBidXMgd2FzIGZ1bGx5IG9jY3VwaWVkIGJlZm9yZSBzdXNwZW5kLCB3aWxs
IHRoaXMgY2F1c2UKdGhlIERBQSBwcm9jZXNzIHRvIGFib3J0IGVudGlyZWx5PwoKcmVuZXNhc19p
M2NfZGFhKCkgewogICAgICAgIC4uLgogICAgICAgIHJldCA9IHJlbmVzYXNfaTNjX2dldF9mcmVl
X3BvcyhpM2MpOwogICAgICAgIGlmIChyZXQgPCAwKQogICAgICAgICAgICAgICAgcmV0dXJuIHJl
dDsKICAgICAgICAuLi4KfQoKSWYgdGhlIGJ1cyBpcyBmdWxsLCBmcmVlX3BvcyB3b3VsZCBiZSAw
LCBjYXVzaW5nIHRoaXMgdG8gcmV0dXJuIC1FTk9TUEMKaW1tZWRpYXRlbHkuIFRoaXMgYWJvcnRz
IGJlZm9yZSB0aGUgRU5UREFBIGNvbW1hbmQgaXMgc2VudCwgd2hpY2ggd291bGQKbGVhdmUgdGhl
IHByZXZpb3VzbHkgYXR0YWNoZWQgZGV2aWNlcyBwZXJtYW5lbnRseSBzdHJhbmRlZCB3aXRob3V0
IGR5bmFtaWMKYWRkcmVzc2VzLgoKPiArCWlmIChyZXQpCj4gKwkJZGV2X2VycihkZXYsICJEQUEg
ZmFpbGVkIG9uIHJlc3VtZSwgcmV0PSVkIiwgcmV0KTsKPiArCj4gIAlpMmNfbWFya19hZGFwdGVy
X3Jlc3VtZWQoJmkzYy0+YmFzZS5pMmMpOwo+ICAKPiArCS8qCj4gKwkgKiBJM0MgZGV2aWNlcyBt
YXkgaGF2ZSByZXRhaW5lZCB0aGVpciBkeW5hbWljIGFkZHJlc3MgYW55d2F5LiBEbyBub3QKPiAr
CSAqIGZhaWwgdGhlIHJlc3VtZSBiZWNhdXNlIG9mIERBQSBlcnJvci4KPiArCSAqLwo+ICAJcmV0
dXJuIDA7CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3Bh
dGNoc2V0LzIwMjYwNzEzMTMwNTQ1LjU2ODY1Ny0xLWNsYXVkaXUuYmV6bmVhK3JlbmVzYXNAdHV4
b24uZGV2P3BhcnQ9NgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1pM2MK
