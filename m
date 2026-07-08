Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E57C44501
	for <linux-i3c@archiver.kernel.org>; Wed,  8 Jul 2026 10:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wn4Pk3ay2eKfv2bd/SFGZwcG8KRmJxY2thdUml3ClxE=; b=ucChbNr7IP0ETY
	vHJkoYCB+BzQm7bR73DodmOUh5+iYuPB2KAvUJbqjWzNMGeQYy/pEzlabjgxNBeGeSjc4fRvlXhnW
	mTMB8cCcw5mMut6PiH/wNwWkWMs6Rm1qDIGZJvm64f6vPpt8ev6oLzwkRjmcyK2VeumVAhlzglyer
	++hCzN5jNLF9lmyBPo5qmR+/8Rq18bVQnU9tfd4nq+zFh+KY+OsI+ifIlenncn9h2BkoLOy1+Dvfj
	gUINUcljc9KM0GF4FHDJJZatu3hzhIVzPwiJnlzeHPuPyh3ziFKtHGzCSLoWmmaD84D+FZjZGzChG
	fv0ehayXVkA26s4nvdcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whP68-0000000GnoX-2NJv;
	Wed, 08 Jul 2026 10:01:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whP66-0000000Gnnu-3jVn
	for linux-i3c@lists.infradead.org;
	Wed, 08 Jul 2026 10:01:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5CD8140554;
	Wed,  8 Jul 2026 10:01:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAE5D1F000E9;
	Wed,  8 Jul 2026 10:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783504902;
	bh=iSprvyttNvNmqZg1xRP8ohu+XuLS77DYVR+xjfpcbXM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hhLcH25zBEeFZnu62oWWEwWX3SBL12AvHTTzrBe7cArKFt60oCM3UOaDhEm2LyQuw
	 7Zsxa0NwlXfO4UYtl45Ek3QApoSaqFgNpvg+rYmv64mCbCHLTs8itApI8U8xPvmnmb
	 ju7L77iWuVd5Mll+moPFg8NR5TsBUcAneSnVLNxWiN7dThxljeUDvPkXsV2etwYbtH
	 lfAm/R7RcIankZar4/BS9DF+JVhJlFrYp1mF7XhKypeFs9ISuiqA4MHkSfCy9v30lo
	 AJgkjaTU3SsF0vvAXuzk/32a/yqGgIKGg4c+Ju1X8bHiJd4ZTXvubrzsR0EoT9BLe+
	 upVUh6+mo7I7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/5] i3c: master: Validate GET CCC payload length and
 retry Direct GET once
To: tze.yee.ng@altera.com
Cc: imx@lists.linux.dev, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org, linux-i3c@lists.infradead.org
In-Reply-To: <b467f01edfaaa0710f30e719ce7f2753b06c1a3f.1783493868.git.tze.yee.ng@altera.com>
References: <cover.1783493867.git.tze.yee.ng@altera.com>
 <b467f01edfaaa0710f30e719ce7f2753b06c1a3f.1783493868.git.tze.yee.ng@altera.com>
Date: Wed, 08 Jul 2026 10:01:41 +0000
Message-Id: <20260708100141.EAE5D1F000E9@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpOZXcgaXNzdWVzOgotIFtNZWRpdW1d
IEluZGlzY3JpbWluYXRlIHJldHJpZXMgb2YgaW50ZXJuYWwga2VybmVsIHNvZnR3YXJlIGVycm9y
cyBkdXJpbmcgSTNDIENDQyBHRVQgY29tbWFuZHMuCgpQcmUtZXhpc3RpbmcgaXNzdWVzOgotIFtI
aWdoXSByZW5lc2FzX2kzY19yeF9pc3Igb3ZlcndyaXRlcyByYXRoZXIgdGhhbiBhcHBlbmRzIHRv
IGNtZC0+cnhfYnVmLCBjb3JydXB0aW5nIGxvbmcgcmVhZCB0cmFuc2ZlcnMgYW5kIGNhdXNpbmcg
RklGTyB1bmRlcmZsb3dzLgotLQoKLS0tIFBhdGNoIFs0XTogW1BBVENIIHY2IDQvNV0gaTNjOiBt
YXN0ZXI6IFZhbGlkYXRlIEdFVCBDQ0MgcGF5bG9hZCBsZW5ndGggYW5kIHJldHJ5IERpcmVjdCBH
RVQgb25jZSAtLS0KY29tbWl0IDA0OTNlODAwMDhjMTlkMTE3ODQ5YmUyMGZlNzEzZDNlMDhhYjU5
OGUKQXV0aG9yOiBBZHJpYW4gTmcgSG8gWWluIDxhZHJpYW4uaG8ueWluLm5nQGFsdGVyYS5jb20+
CgppM2M6IG1hc3RlcjogVmFsaWRhdGUgR0VUIENDQyBwYXlsb2FkIGxlbmd0aCBhbmQgcmV0cnkg
RGlyZWN0IEdFVCBvbmNlCgpUaGlzIGNvbW1pdCBhZGRzIHJldHJ5IGxvZ2ljIGZvciBEaXJlY3Qg
R0VUIENDQyBjb21tYW5kcyBhbmQgdmFsaWRhdGVzCnRoZSBwYXlsb2FkIGxlbmd0aCBvZiBHRVQg
Q0NDcyBhZnRlciBhIHN1Y2Nlc3NmdWwgdHJhbnNmZXIuIEZhaWxlZCBEaXJlY3QKR0VUIENDQ3Mg
YXJlIHJldHJpZWQgdXAgdG8gY21kLT5yZXRyaWVzIHRpbWVzIHdoZW4gdGhlIGRyaXZlciByZXBv
cnRzCmZhaWx1cmUgb3IgYW4gSTNDIGVycm9yLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2Mv
bWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIuYwo+IGluZGV4IDM2NjZkMDExZjEwZWEuLjk2
NWQ3NGU2YmYxNjYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyLmMKPiArKysgYi9k
cml2ZXJzL2kzYy9tYXN0ZXIuYwoKWyAuLi4gXQoKPiBAQCAtMTAwNSw3ICsxMDM3LDI1IEBAIHN0
YXRpYyBpbnQgaTNjX21hc3Rlcl9zZW5kX2NjY19jbWRfbG9ja2VkKHN0cnVjdCBpM2NfbWFzdGVy
X2NvbnRyb2xsZXIgKm1hc3RlciwKPiAgCSAgICAhbWFzdGVyLT5vcHMtPnN1cHBvcnRzX2NjY19j
bWQobWFzdGVyLCBjbWQpKQo+ICAJCXJldHVybiAtRU9QTk9UU1VQUDsKPiAgCj4gLQlyZXR1cm4g
bWFzdGVyLT5vcHMtPnNlbmRfY2NjX2NtZChtYXN0ZXIsIGNtZCk7Cj4gKwltYXhfYXR0ZW1wdHMg
PSBjbWQtPnJldHJpZXMgKyAxOwo+ICsJcmV0ID0gLUVJTzsKPiArCWZvciAoYXR0ZW1wdCA9IDA7
IGF0dGVtcHQgPCBtYXhfYXR0ZW1wdHM7IGF0dGVtcHQrKykgewo+ICsJCXVuc2lnbmVkIGludCBp
Owo+ICsKPiArCQlpZiAoY21kLT5ybncpCj4gKwkJCWZvciAoaSA9IDA7IGkgPCBjbWQtPm5kZXN0
czsgaSsrKQo+ICsJCQkJY21kLT5kZXN0c1tpXS5wYXlsb2FkLmFjdHVhbF9sZW4gPSAwOwo+ICsK
PiArCQljbWQtPmVyciA9IEkzQ19FUlJPUl9VTktOT1dOOwo+ICsJCXJldCA9IG1hc3Rlci0+b3Bz
LT5zZW5kX2NjY19jbWQobWFzdGVyLCBjbWQpOwo+ICsJCWlmICghcmV0ICYmIGNtZC0+ZXJyID09
IEkzQ19FUlJPUl9VTktOT1dOKQo+ICsJCQlicmVhazsKCltTZXZlcml0eTogTWVkaXVtXQpEb2Vz
IHRoaXMgbG9vcCBhbHNvIHJldHJ5IGludGVybmFsIGtlcm5lbCBzb2Z0d2FyZSBlcnJvcnM/CgpJ
ZiBhIGhvc3Qgc29mdHdhcmUgZXJyb3Igb2NjdXJzIChmb3IgZXhhbXBsZSwgLUVOT01FTSBkdXJp
bmcgRE1BIGRlc2NyaXB0b3IKYWxsb2NhdGlvbiwgb3IgLUVPUE5PVFNVUFApLCBtYXN0ZXItPm9w
cy0+c2VuZF9jY2NfY21kKCkgd2lsbCByZXR1cm4gdGhlCmVycm9yIGNvZGUuIFRoaXMgYnlwYXNz
ZXMgdGhlICFyZXQgYnJlYWsgY29uZGl0aW9uLCBjYXVzaW5nIHRoZSBsb29wIHRvCnJldHJ5IGlu
ZGlzY3JpbWluYXRlbHkuCgpTaG91bGQgdGhlIGxvb3AgZXhwbGljaXRseSBkaXN0aW5ndWlzaCBi
ZXR3ZWVuIGJ1cy1sZXZlbCBJM0MgZXJyb3JzIHRoYXQKbmVlZCByZXRyaWVzIGFuZCBsb2NhbCBz
b2Z0d2FyZSBlcnJvcnMgdGhhdCBzaG91bGQgaW1tZWRpYXRlbHkgYWJvcnQ/Cgo+ICsJfQo+ICsK
PiArCWlmICghcmV0KQo+ICsJCXJldCA9IGkzY19jY2NfdmFsaWRhdGVfcGF5bG9hZF9sZW4oY21k
KTsKPiArCj4gKwlyZXR1cm4gcmV0Owo+ICB9CgpbIC4uLiBdCgpXaGlsZSByZXZpZXdpbmcgdGhl
IHJldHJpZXMgZm9yIEdFVCBDQ0MgY29tbWFuZHMsIEkgbm90aWNlZCBhIHNlcGFyYXRlIGlzc3Vl
CmluIHRoZSBSZW5lc2FzIEkzQyBkcml2ZXIncyByZWNlaXZlIGludGVycnVwdCBoYW5kbGVyOgoK
ZHJpdmVycy9pM2MvbWFzdGVyL3JlbmVzYXMtaTNjLmM6cmVuZXNhc19pM2NfcnhfaXNyKCkgewog
ICAgLi4uCiAgICB9IGVsc2UgewogICAgICAgIHJlYWRfYnl0ZXMgPSBOREJTVExWMF9SREJMVihy
ZW5lc2FzX3JlYWRsKGkzYy0+cmVncywgTkRCU1RMVjApKSAqIHNpemVvZih1MzIpOwogICAgICAg
IGkzY19yZWFkbF9maWZvKGkzYy0+cmVncyArIE5URFRCUDAsIGNtZC0+cnhfYnVmLCByZWFkX2J5
dGVzKTsKICAgICAgICBjbWQtPnJ4X2NvdW50ID0gcmVhZF9ieXRlczsKICAgIH0KICAgIC4uLgp9
CgpbU2V2ZXJpdHk6IEhpZ2hdClRoaXMgaXNuJ3QgYSBidWcgaW50cm9kdWNlZCBieSB0aGlzIHBh
dGNoLCBidXQgZG9lcyB0aGlzIG92ZXJ3cml0ZSB0aGUKcmVjZWl2ZSBidWZmZXIgcmF0aGVyIHRo
YW4gYXBwZW5kaW5nIHRvIGl0PwoKV2hlbiBhbiBJM0MgcmVhZCB0cmFuc2ZlciBleGNlZWRzIHRo
ZSBGSUZPIHRocmVzaG9sZCwgcmVuZXNhc19pM2NfcnhfaXNyKCkKZmlyZXMgbXVsdGlwbGUgdGlt
ZXMuIEluc3RlYWQgb2YgYXBwZW5kaW5nIHJlY2VpdmVkIGJ5dGVzIHRvCmNtZC0+cnhfYnVmICsg
Y21kLT5yeF9jb3VudCBhbmQgYWNjdW11bGF0aW5nIGNtZC0+cnhfY291bnQgKz0gcmVhZF9ieXRl
cywgaXQKd3JpdGVzIHRvIHRoZSBiYXNlIGFkZHJlc3Mgb2YgY21kLT5yeF9idWYgYW5kIHJlc2V0
cyBjbWQtPnJ4X2NvdW50LgoKTGF0ZXIsIHJlbmVzYXNfaTNjX3Jlc3BfaXNyKCkgY2FsY3VsYXRl
cyBieXRlc19yZW1haW5pbmcgPSBkYXRhX2xlbiAtCmNtZC0+cnhfY291bnQuIEJlY2F1c2Ugcnhf
Y291bnQgb25seSByZWZsZWN0cyB0aGUgc2l6ZSBvZiB0aGUgbGFzdCBjaHVuaywKYnl0ZXNfcmVt
YWluaW5nIGV4Y2VlZHMgdGhlIGFjdHVhbCBkYXRhIGxlZnQgaW4gdGhlIEZJRk8sIHdoaWNoIGNv
dWxkIGNhdXNlCmFuIHVuZGVyZmxvdyBhbmQgcmVhZCBnYXJiYWdlIGRhdGEuCgotLSAKU2FzaGlr
byBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0L2NvdmVyLjE3ODM0
OTM4NjcuZ2l0LnR6ZS55ZWUubmdAYWx0ZXJhLmNvbT9wYXJ0PTQKCi0tIApsaW51eC1pM2MgbWFp
bGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
