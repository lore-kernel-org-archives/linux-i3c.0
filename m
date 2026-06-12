Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21587CD8CA8
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Jun 2026 11:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sdr3AAk+QjoGoHORQ7oxy26eK0gqP2/uAoxEH++DGP8=; b=ZcygrrAkuim9GS
	APiafQqpLoRNCxSdn0RqVdxtsSDQIFlfSJsISHaHc/lpRrLQRwcbk8qF3bHK+YZFD4aGL7EJ52T8V
	AHWXjnQbt03uBOIQX5cSBNPGdciZzK1gXeZ3sFA2eIXdHTiEVJQ9vm5Lf7HWQlE76m54azS7iw8M7
	Y2hfptNeAKzprN2DQ6p191F9inECpHLeFdc9qPSTBWv7vUhCGdIzIXrnadf0PDmfy77+elM3DsAp4
	zhNL40aP8E1aNmox2ORYB3rSTYXVLC7aSNi9gyjMljeTNvEImnaUouzYotQs99MJs0bSAAxrpQ4wy
	RSOV/NXNfUBo99w+cWCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY0CL-0000000AoMs-3JEq;
	Fri, 12 Jun 2026 11:37:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY0CK-0000000AoMl-1s7h
	for linux-i3c@lists.infradead.org;
	Fri, 12 Jun 2026 11:37:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2D5F160008;
	Fri, 12 Jun 2026 11:37:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C43C1F000E9;
	Fri, 12 Jun 2026 11:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781264234;
	bh=3FnlGnEeougb++UwwkWIjZvRPL8kdIGfX3pA3wxOJAk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eZD6FFgAXXSy+6FBCtlJlC0MyNNHap6hWJAXl7eU7Gf6j4K1XnBrm/P7bW4bqJ1oB
	 HDg+v+jAKk7YustzPMV9F1T960Jm6+E6Szzlhk+CR2N7cxkuhuwNgaNvXDAn+7O8vL
	 yxKNYn6VIF5Rjdm01JiV0p7F+InL+Flym49ySrvzWwOeMlLi8fXBcJydXv+v1hN8rW
	 TsDomDev2JDgmKArIQuz7MOlEJnWmhPHRgVFAENGAvI0t4awC20yzTKewbDFzi/7Vu
	 gggsQCjasRODiOsn1svCc86xFlwZ2kMXkdpmGSO+NwIoSsz3ScNAmaeDDlL1KBbUd9
	 tpzxs/Zqs8jug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 6/9] regulator: p3h2x4x: Add driver for on-die
 regulators in NXP P3H2x4x i3c hub
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: conor+dt@kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260612111816.3688240-7-lakshay.piplani@nxp.com>
References: <20260612111816.3688240-7-lakshay.piplani@nxp.com>
Date: Fri, 12 Jun 2026 11:37:13 +0000
Message-Id: <20260612113714.8C43C1F000E9@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIENvbmN1cnJlbnQgaGFy
ZHdhcmUgb3BlcmF0aW9ucyBvbiBkaWZmZXJlbnQgcmVndWxhdG9ycyBzaGFyZSB0aGUgc2FtZSBw
cm90ZWN0aW9uIGxvY2sgcmVnaXN0ZXIgd2l0aG91dCBhIGNyb3NzLWRldmljZSBzaGFyZWQgbG9j
aywgbGVhZGluZyB0byBhIHJhY2UgY29uZGl0aW9uIHdoZXJlIHJlZ3VsYXRvciB3cml0ZXMgZmFp
bCBzaWxlbnRseS4KLSBbSGlnaF0gSS9PIGVycm9ycyBkdXJpbmcgaGFyZHdhcmUgdW5sb2NrIGFy
ZSBzaWxlbnRseSBpZ25vcmVkLCBsZWFkaW5nIHRvIGZhbHNlIHN1Y2Nlc3MgcmV0dXJucyBmb3Ig
cmVndWxhdG9yIG9wZXJhdGlvbnMuCi0tCgpjb21taXQgOGZiODQ2ODM1NTExYzQ4N2RkMDRkZjU3
NmNhNTNmZGJjMDg5ODM5YQpBdXRob3I6IEFtYW4gS3VtYXIgUGFuZGV5IDxhbWFuLmt1bWFycGFu
ZGV5QG54cC5jb20+ClN1YmplY3Q6IHJlZ3VsYXRvcjogcDNoMng0eDogQWRkIGRyaXZlciBmb3Ig
b24tZGllIHJlZ3VsYXRvcnMgaW4gTlhQIFAzSDJ4NHggaTNjIGh1YgoKVGhlIE5YUCBQM0gyeDR4
IGZhbWlseSBpbnRlZ3JhdGVzIG9uLWRpZSByZWd1bGF0b3JzIGFsb25nc2lkZSBJM0MgaHViCmZ1
bmN0aW9uYWxpdHkuIFRoaXMgZHJpdmVyIHJlZ2lzdGVycyB0aGUgcmVndWxhdG9ycyB1c2luZyB0
aGUgTUZECmZyYW1ld29yayBhbmQgZXhwb3NlcyB0aGVtIHZpYSB0aGUgcmVndWxhdG9yIHN1YnN5
c3RlbS4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcmVndWxhdG9yL3AzaDI4NDBfaTNjX2h1Yl9y
ZWd1bGF0b3IuYyBiL2RyaXZlcnMvcmVndWxhdG9yL3AzaDI4NDBfaTNjX2h1Yl9yZWd1bGF0b3Iu
Ywo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwMC4uNGYyNTE0ZDRk
OTI4ZQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9kcml2ZXJzL3JlZ3VsYXRvci9wM2gyODQwX2kz
Y19odWJfcmVndWxhdG9yLmMKClsgLi4uIF0KCj4gK3N0YXRpYyB2b2lkIHAzaDJ4NHhfcmVnX2d1
YXJkX2VudGVyKHN0cnVjdCByZWd1bGF0b3JfZGV2ICpyZGV2LAo+ICsJCQkJICAgIHN0cnVjdCBw
M2gyeDR4X3JlZ19zdGF0ZSAqc3RhdGUpCj4gK3sKPiArCXN0YXRlLT5yZXN0b3JlID0gZmFsc2U7
Cj4gKwo+ICsJaWYgKHJlZ21hcF9yZWFkKHJkZXYtPnJlZ21hcCwKPiArCQkJUDNIMlg0WF9ERVZf
UkVHX1BST1RFQ1RJT05fQ09ERSwKPiArCQkJJnN0YXRlLT5vcmlnKSkKPiArCQlyZXR1cm47Cgpb
U2V2ZXJpdHk6IEhpZ2hdCklmIHRoaXMgcmVnbWFwX3JlYWQoKSBmYWlscywgdGhlIGZ1bmN0aW9u
IHJldHVybnMgc2lsZW50bHkgc2luY2UgaXQKaGFzIGEgdm9pZCByZXR1cm4gdHlwZS4gV2lsbCB0
aGlzIGNhdXNlIHN1YnNlcXVlbnQgcmVndWxhdG9yIG9wZXJhdGlvbnMKbGlrZSByZWd1bGF0b3Jf
ZW5hYmxlX3JlZ21hcCgpIHRvIGV4ZWN1dGUgYmxpbmRseSBvbiBsb2NrZWQgaGFyZHdhcmUsIApp
Z25vcmluZyB0aGUgY29uZmlndXJhdGlvbiB3cml0ZSBidXQgcmV0dXJuaW5nIGEgZmFsc2Ugc3Vj
Y2VzcyB0byB0aGUgY2FsbGVyPwoKPiArCj4gKwlpZiAoc3RhdGUtPm9yaWcgIT0gUDNIMlg0WF9S
RUdJU1RFUlNfVU5MT0NLX0NPREUpIHsKPiArCQlyZWdtYXBfd3JpdGUocmRldi0+cmVnbWFwLAo+
ICsJCQkgICAgIFAzSDJYNFhfREVWX1JFR19QUk9URUNUSU9OX0NPREUsCj4gKwkJCSAgICAgUDNI
Mlg0WF9SRUdJU1RFUlNfVU5MT0NLX0NPREUpOwo+ICsJCXN0YXRlLT5yZXN0b3JlID0gdHJ1ZTsK
PiArCX0KPiArfQo+ICsKPiArc3RhdGljIHZvaWQgcDNoMng0eF9yZWdfZ3VhcmRfZXhpdChzdHJ1
Y3QgcmVndWxhdG9yX2RldiAqcmRldiwKPiArCQkJCSAgIHN0cnVjdCBwM2gyeDR4X3JlZ19zdGF0
ZSAqc3RhdGUpCj4gK3sKPiArCWlmIChzdGF0ZS0+cmVzdG9yZSkKPiArCQlyZWdtYXBfd3JpdGUo
cmRldi0+cmVnbWFwLAo+ICsJCQkgICAgIFAzSDJYNFhfREVWX1JFR19QUk9URUNUSU9OX0NPREUs
Cj4gKwkJCSAgICAgc3RhdGUtPm9yaWcpOwo+ICt9Cj4gKwo+ICtERUZJTkVfTE9DS19HVUFSRF8x
KHAzaDJ4NHhfcmVnLCBzdHJ1Y3QgcmVndWxhdG9yX2RldiwKPiArCQkgICAgcDNoMng0eF9yZWdf
Z3VhcmRfZW50ZXIoX1QtPmxvY2ssICZfVC0+c3RhdGUpLAo+ICsJCSAgICBwM2gyeDR4X3JlZ19n
dWFyZF9leGl0KF9ULT5sb2NrLCAmX1QtPnN0YXRlKSwKPiArCQkgICAgc3RydWN0IHAzaDJ4NHhf
cmVnX3N0YXRlIHN0YXRlKTsKPiArCj4gK3N0YXRpYyBpbnQgcDNoMng0eF9yZWd1bGF0b3JfZW5h
YmxlKHN0cnVjdCByZWd1bGF0b3JfZGV2ICpyZGV2KQo+ICt7Cj4gKwlndWFyZChwM2gyeDR4X3Jl
ZykocmRldik7CgpbU2V2ZXJpdHk6IEhpZ2hdCkNvdWxkIHRoZXJlIGJlIGEgcmFjZSBjb25kaXRp
b24gaGVyZSBiZXR3ZWVuIGRpZmZlcmVudCByZWd1bGF0b3IgaW5zdGFuY2VzPwoKVGhlIFAzSDJY
NFhfREVWX1JFR19QUk9URUNUSU9OX0NPREUgcmVnaXN0ZXIgYXBwZWFycyB0byBiZSBhIHNoYXJl
ZApkZXZpY2Utd2lkZSByZXNvdXJjZSwgYnV0IGd1YXJkKHAzaDJ4NHhfcmVnKSByZWxpZXMgb24g
cmRldi0+bXV0ZXgsIHdoaWNoCm9ubHkgc2VyaWFsaXplcyBvcGVyYXRpb25zIGZvciBhIHNpbmds
ZSByZWd1bGF0b3IgaW5zdGFuY2UuCgpJZiB0d28gdGhyZWFkcyBhY2Nlc3MgZGlmZmVyZW50IHJl
Z3VsYXRvcnMgKGUuZy4sIGxkby1jcDAgYW5kIGxkby1jcDEpIApjb25jdXJyZW50bHksIGNvdWxk
IHRoZXkgaW50ZXJsZWF2ZSBsaWtlIHRoaXM6CgpUaHJlYWQgQSByZWFkcyBzdGF0ZS0+b3JpZywg
c2VlcyBsb2NrZWQsIHdyaXRlcyB1bmxvY2ssIHNldHMgcmVzdG9yZT10cnVlClRocmVhZCBCIHJl
YWRzIHN0YXRlLT5vcmlnLCBzZWVzIHVubG9ja2VkLCBzZXRzIHJlc3RvcmU9ZmFsc2UKVGhyZWFk
IEEgY29tcGxldGVzIGl0cyB1cGRhdGUsIHJ1bnMgZ3VhcmRfZXhpdCwgYW5kIHJlbG9ja3MgdGhl
IGRldmljZQpUaHJlYWQgQiBhdHRlbXB0cyBpdHMgcmVndWxhdG9yIHVwZGF0ZSwgYnV0IHRoZSBo
YXJkd2FyZSBpcyBub3cgbG9ja2VkCgpXb3VsZCBpdCBiZSBzYWZlciB0byB1c2UgYSBzaGFyZWQg
ZGV2aWNlLWxldmVsIGxvY2sgaW4gdGhlIHBhcmVudCBNRkQKZGV2aWNlIHRvIHByb3RlY3QgdGhl
IGhhcmR3YXJlIHByb3RlY3Rpb24gcmVnaXN0ZXI/Cgo+ICsJcmV0dXJuIHJlZ3VsYXRvcl9lbmFi
bGVfcmVnbWFwKHJkZXYpOwo+ICt9CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9z
YXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNjEyMTExODE2LjM2ODgyNDAtMS1sYWtzaGF5LnBp
cGxhbmlAbnhwLmNvbT9wYXJ0PTYKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkz
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtaTNjCg==
