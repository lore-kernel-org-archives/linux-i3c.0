Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39EFC55822
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Aug 2026 15:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UxcRaUS/0RDncMaAkuxUyuuztVzFGIMU0AfXJmQpLtc=; b=iia9uUp34ak5Ex
	T1/lXga3IwTCPICPwH2YKDFQrP0qlmM+r4CTUtRC5H4wbJ79sE891ACjoL9EQCIfjXC6ijmuGmVo0
	BYIo9Iozom0DUeVbjZIsm1ZRJSJrOlmx2/WtWkpIJ5rP4f7paF2SeL09m7e33ygDsOnorg0KMcQzl
	XHj8gaE0aIIQ3NgiUwMA8UBZXnzM0FqVqhA8a03goKZv3fnvE1aKuztspIJh/SdmkbOOvikjZX0W7
	SLnSH5dUYL991P1YfqWPplq8iv4MaE45QGSZ0PmKFW96VP/f9yHObIVgh3czF3L9QSiFP/5l0E54Y
	6dq8zeHTV2OvLxfl16Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGmc-00000002B1Z-2JJw;
	Tue, 04 Aug 2026 15:10:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGma-00000002B1D-3lyg
	for linux-i3c@lists.infradead.org;
	Tue, 04 Aug 2026 15:10:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5B2EC60A75;
	Tue,  4 Aug 2026 15:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCAA81F000E9;
	Tue,  4 Aug 2026 15:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785856220;
	bh=Cnsggypc6ihctNmR1lbKZANczuzfHh4gesfVpYky0YE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JDgk2ZdYO5vCgGD9y4AmAM3B+ZOwSzgisvRETDrsFBRcISKeSXYMFzhhr8FzcKytq
	 NuDXvysD7uvkY2J3YSVVpRpoCAi0hemdNiqh8broJrByhtYRoktmmzIdlGdLok+ZZu
	 +BTH/mrvrbV366swbqXIM3bumuaLLoCisEyAA+BVhQUb961jL/nfEVEQAtfw6hb4mx
	 /Fde/Toc2vF1TIdtDBbA1BbzdLLWZ7nrEqBwXiYvN0J44EcpWKEBMvGbKU7a6q3fuY
	 U6JR+lkXVHY899LsyuHgCzqYAjAc3605zq4HOHiqrdxZBDA2kCKQQZ20J7FfWAJAPk
	 hO4Z2cVrb4J7Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V3 09/14] i3c: master: Report wakeup events for IBIs
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-pci@vger.kernel.org, linux-i3c@lists.infradead.org
In-Reply-To: <20260804133810.184905-10-adrian.hunter@intel.com>
References: <20260804133810.184905-1-adrian.hunter@intel.com>
 <20260804133810.184905-10-adrian.hunter@intel.com>
Date: Tue, 04 Aug 2026 15:10:18 +0000
Message-Id: <20260804151019.BCAA81F000E9@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpOZXcgaXNzdWVzOgotIFtIaWdoXSBV
bnByb3RlY3RlZCBkZXJlZmVyZW5jZSBvZiBkZXYtPmRldiBpbiBpM2NfbWFzdGVyX3F1ZXVlX2li
aSgpIGxlYWRpbmcgdG8gTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIG9yIFVzZS1BZnRlci1GcmVl
IGR1cmluZyB0ZWFyZG93bi4KClByZS1leGlzdGluZyBpc3N1ZXM6Ci0gW0hpZ2hdIFJhY2UgY29u
ZGl0aW9uIGJldHdlZW4gaGFyZHdhcmUgSUJJIGludGVycnVwdHMgYW5kIElCSSB0ZWFyZG93biBs
ZWFkaW5nIHRvIFVzZS1BZnRlci1GcmVlIG9mIGRldi0+aWJpLgotLQoKLS0tIFBhdGNoIFs5XTog
W1BBVENIIFYzIDA5LzE0XSBpM2M6IG1hc3RlcjogUmVwb3J0IHdha2V1cCBldmVudHMgZm9yIElC
SXMgLS0tCmNvbW1pdCAwNDRiMzBlODgxM2M0NjZlZTBjOTU1ZjI4MmEwODExNzAzNzBhNTY0CkF1
dGhvcjogQWRyaWFuIEh1bnRlciA8YWRyaWFuLmh1bnRlckBpbnRlbC5jb20+CgppM2M6IG1hc3Rl
cjogUmVwb3J0IHdha2V1cCBldmVudHMgZm9yIElCSXMKCldoZW4gYW4gSUJJIGlzIHF1ZXVlZCBm
b3IgcHJvY2Vzc2luZywgdGhpcyBjb21taXQgcmVjb3JkcyBhIHdha2V1cCBldmVudApmb3IgdGhl
IGRldmljZSBpZiB3YWtldXAgaXMgZW5hYmxlZC4gSXQgdXNlcyBhIDEwMCBtcyBwcm9jZXNzaW5n
IGludGVydmFsCnRvIGdpdmUgdGhlIEkzQyBkZXZpY2UgZHJpdmVyIHRpbWUgdG8gcHJvY2VzcyB0
aGUgSUJJLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyLmMgYi9kcml2ZXJzL2kz
Yy9tYXN0ZXIuYwo+IGluZGV4IGU2YjMyMGRhNDc1ZTAuLjhjOWU2MmU2ZjE0NjkgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyLmMKPiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIuYwo+
IEBAIC0zMzk4LDYgKzM0MDEsOSBAQCB2b2lkIGkzY19tYXN0ZXJfcXVldWVfaWJpKHN0cnVjdCBp
M2NfZGV2X2Rlc2MgKmRldiwgc3RydWN0IGkzY19pYmlfc2xvdCAqc2xvdCkKPiAgCWlmICghZGV2
LT5pYmkgfHwgIXNsb3QpCj4gIAkJcmV0dXJuOwo+ICAKPiArCWlmIChkZXZpY2VfbWF5X3dha2V1
cCgmZGV2LT5kZXYtPmRldikpCj4gKwkJcG1fd2FrZXVwX2V2ZW50KCZkZXYtPmRldi0+ZGV2LCBJ
M0NfV0FLRVVQX1BST0NFU1NJTkdfVElNRV9NUyk7Cj4gKwoKW1NldmVyaXR5OiBIaWdoXQpJcyBp
dCBwb3NzaWJsZSBmb3IgYW4gSUJJIGludGVycnVwdCB0byBmaXJlIGNvbmN1cnJlbnRseSB3aXRo
IGRldmljZQp1bnJlZ2lzdHJhdGlvbj8KCkxvb2tpbmcgYXQgaTNjX21hc3Rlcl91bnJlZ2lzdGVy
X2kzY19kZXZzKCksIHRoZSB0ZWFyZG93biBwYXRoIHNldHMKZGV2LT5kZXYgdG8gTlVMTDoKCmRy
aXZlcnMvaTNjL21hc3Rlci5jOmkzY19tYXN0ZXJfdW5yZWdpc3Rlcl9pM2NfZGV2cygpIHsKICAg
IC4uLgogICAgaTNjZGV2LT5kZXYtPmRlc2MgPSBOVUxMOwogICAgcHV0X2RldmljZSgmaTNjZGV2
LT5kZXYtPmRldik7CiAgICBpM2NkZXYtPmRldiA9IE5VTEw7CiAgICAuLi4KfQoKSWYgYW4gaW50
ZXJydXB0IG9jY3VycyBkdXJpbmcgb3IganVzdCBhZnRlciB0aGlzIHVucmVnaXN0cmF0aW9uLCBj
b3VsZApkZXYtPmRldiBiZSBOVUxMIHdoZW4gZGV2aWNlX21heV93YWtldXAoKSBkZXJlZmVyZW5j
ZXMgaXQgaGVyZT8KCj4gIAlhdG9taWNfaW5jKCZkZXYtPmliaS0+cGVuZGluZ19pYmlzKTsKPiAg
CXF1ZXVlX3dvcmsoZGV2LT5pYmktPndxLCAmc2xvdC0+d29yayk7Cj4gIH0KCltTZXZlcml0eTog
SGlnaF0KVGhpcyBpcyBhIHByZS1leGlzdGluZyBpc3N1ZSwgYnV0IGlzIHRoZXJlIGEgcmFjZSBj
b25kaXRpb24gYmV0d2VlbiBoYXJkd2FyZQpJQkkgaW50ZXJydXB0cyBhbmQgSUJJIHRlYXJkb3du
IGxlYWRpbmcgdG8gYSB1c2UtYWZ0ZXItZnJlZSBvZiBkZXYtPmliaT8KCkluIGkzY19kZXZfZGlz
YWJsZV9pYmlfbG9ja2VkKCksIHRoZSBjb2RlIGNoZWNrcyB0aGUgcGVuZGluZ19pYmlzIGNvdW50
ZXI6Cgpkcml2ZXJzL2kzYy9tYXN0ZXIuYzppM2NfZGV2X2Rpc2FibGVfaWJpX2xvY2tlZCgpIHsK
ICAgIC4uLgogICAgaWYgKGF0b21pY19yZWFkKCZkZXYtPmliaS0+cGVuZGluZ19pYmlzKSkKICAg
ICAgICB3YWl0X2Zvcl9jb21wbGV0aW9uKCZkZXYtPmliaS0+YWxsX2liaXNfaGFuZGxlZCk7CiAg
ICAuLi4KfQoKSWYgYSBoYXJkaXJxIGhhbmRsZXIgaXMgYWxyZWFkeSBleGVjdXRpbmcgYnV0IGhh
cyBub3QgeWV0IGNhbGxlZAppM2NfbWFzdGVyX3F1ZXVlX2liaSgpIHRvIGluY3JlbWVudCBwZW5k
aW5nX2liaXMsIHRoZSB0ZWFyZG93biBwYXRoIG1pZ2h0CmFzc3VtZSBubyBJQklzIGFyZSBwZW5k
aW5nIGFuZCBwcm9jZWVkIHRvIGZyZWUgZGV2LT5pYmkgaW4KaTNjX2Rldl9mcmVlX2liaV9sb2Nr
ZWQoKS4KCldoZW4gdGhlIGludGVycnVwdGVkIENQVSByZXN1bWVzLCB3b3VsZG4ndCBpdCBleGVj
dXRlIHRoaXMgYXRvbWljX2luYygpIGFuZApxdWV1ZV93b3JrKCkgb24gdGhlIGZyZWVkIGRldi0+
aWJpIHBvaW50ZXIgc2luY2UgdGhlcmUgaXMgbm8Kc3luY2hyb25pemVfaXJxKCkgdG8gZHJhaW4g
YWN0aXZlIGhhcmRpcnFzPwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlr
by5kZXYvIy9wYXRjaHNldC8yMDI2MDgwNDEzMzgxMC4xODQ5MDUtMS1hZHJpYW4uaHVudGVyQGlu
dGVsLmNvbT9wYXJ0PTkKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtaTNjCg==
