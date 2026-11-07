Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960BD606A326
	for <linux-i3c@archiver.kernel.org>; Sat,  7 Nov 2026 11:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K/csRJhp;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NDa1R07u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dZ+JqUzQ14eAvcS/0xJes5g5Dea+khM8JUsm60hx9RQ=; b=K/csRJhp5EK9Y5XpUp2XjzLaLm
	kC6VKLa4pzoE9TzBevT3T6fC7Y+Ncl+8FHRv8HOv2lOntcOkvJShzSUCXwJpSCuugadv6d3wegjG4
	pqLzZhs28xO05wYwRvdar46F9Wcsz1yFrC+AAOn+e1Y3KxV6Hl1A8KRSCYfbKba70jiVFMies0rmf
	TasCL4XsqmsCoSiUZldOIZP7hlvEU2Kw39IFsLIkt0FaVlT4CSrWSO4fLi5rIgkGaj2MonNshdI35
	50QB1dPUQkdqEZuK2iR2VnKRTFRaU/qH/WilbsFSTTdcBWwYEHEEPB37iHcdpgyHGnKRK0TGdJN/R
	/HdavLNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPeRv-0000000EbFf-1zjq;
	Sat, 07 Nov 2026 11:19:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPeRt-0000000EbFZ-38wG
	for linux-i3c@lists.infradead.org;
	Sat, 07 Nov 2026 11:19:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1164B6111E;
	Sat,  7 Nov 2026 11:19:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DD2F1F008A1;
	Sat,  7 Nov 2026 11:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794050344;
	bh=YtuVTWGrUP1mDeFWkKsdD7n1oo4E0Md9WL8rq3QNzDw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NDa1R07upVN99xpilu4mcTy9ZfSK52clOKpT1Jvehmetm10M0Vo5aUoXv12IjaHfb
	 nnB+dEjiuB9lOs/OvEt8tFkmdjCg51ZMCvI65X4XWYGJQvQoNuMZSpIcoim4ExspHc
	 eqx+IaMOCJM+8R3fXE/YhVUtyYdB9Bf6okr46NzH3Ek1bWexW8PNeq4qs0urrOnTy2
	 ZSS0CjFQr0HsEG2gJD5kO9J9rieb+JVaNA9xOe/jYioTatl3kKtJSMQTpnb5TDT+0U
	 MYJiXZHMhjwydsY752pem98Lv8/Ahkt7iDittjN+4lWh2TTIUA4DZhCSBvqksb9EX5
	 Nd4qbVIcMIo6A==
Message-ID: <sashiko-outbox-202850@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] i3c: master: svc: remove redundant
 pm_runtime_dont_use_autosuspend() calls
To: "Joshua Crofts" <crofts@kernel.org>
Cc: linux-i3c@lists.infradead.org, imx@lists.linux.dev, Frank.Li@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20261107-dont-use-autosuspend-i3c-v1-2-80a1546354ce@kernel.org>
References: <20261107-dont-use-autosuspend-i3c-v1-0-80a1546354ce@kernel.org>
 <20261107-dont-use-autosuspend-i3c-v1-2-80a1546354ce@kernel.org>
Date: Sat, 07 Nov 2026 11:19:04 +0000
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gaTNjOiBtYXN0ZXI6IHN2
YzogY2xvY2sgYW5kIHBpbmN0cmwgbGVhayBpbgogIHN2Y19pM2NfbWFzdGVyX3JlbW92ZSgpCkl0
IGFsc28gbm90aWNlZCAxIHJlbGF0ZWQgcHJlLWV4aXN0aW5nIGlzc3VlIHRoaXMgcGF0Y2ggZG9l
cyBub3QKaW50cm9kdWNlOgotIFtNZWRpdW1dIGkzYzogbWFzdGVyOiBzdmM6IGJyb2tlbiBwcm9i
ZSBkZWZlcnJhbCBpbgogIHN2Y19pM2NfbWFzdGVyX3Byb2JlKCkgWzFdCi0tCgpjb21taXQgYmQz
MTZlYTkwNWJjN2NkMjVlNTU3YjllN2NlYWFmODY1MzRiMzFjNQpBdXRob3I6IEpvc2h1YSBDcm9m
dHMgPGNyb2Z0c0BrZXJuZWwub3JnPgoKaTNjOiBtYXN0ZXI6IHN2YzogcmVtb3ZlIHJlZHVuZGFu
dCBwbV9ydW50aW1lX2RvbnRfdXNlX2F1dG9zdXNwZW5kKCkgY2FsbHMKClRoaXMgY29tbWl0IHJl
bW92ZXMgcG1fcnVudGltZV9kb250X3VzZV9hdXRvc3VzcGVuZCgpIGNhbGxzIGZyb20gdGhlIHBy
b2JlCmVycm9yIHBhdGggYW5kIHJlbW92ZSBjYWxsYmFjayBpbiBzdmMtaTNjLW1hc3Rlci4KCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jIGIvZHJpdmVy
cy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKPiBpbmRleCBlNzAwMzkyZjA4MDFmLi45Yjg0
NWIyOTU1YmU0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rl
ci5jCj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKPiBAQCAtMjA4
NCw3ICsyMDg0LDYgQEAgc3RhdGljIGludCBzdmNfaTNjX21hc3Rlcl9wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJcmV0dXJuIDA7Cj4gIAo+ICBycG1fZGlzYWJsZToKPiAt
CXBtX3J1bnRpbWVfZG9udF91c2VfYXV0b3N1c3BlbmQoJnBkZXYtPmRldik7Cj4gIAlwbV9ydW50
aW1lX3B1dF9ub2lkbGUoJnBkZXYtPmRldik7Cj4gIAlwbV9ydW50aW1lX2Rpc2FibGUoJnBkZXYt
PmRldik7Cj4gIAlwbV9ydW50aW1lX3NldF9zdXNwZW5kZWQoJnBkZXYtPmRldik7CgpbU2V2ZXJp
dHk6IE1lZGl1bV0KVGhpcyBwcm9ibGVtIHdhc24ndCBpbnRyb2R1Y2VkIGJ5IHRoaXMgcGF0Y2gs
IGJ1dCBlYXJsaWVyIGluCnN2Y19pM2NfbWFzdGVyX3Byb2JlKCkgWzFdLCBkb2VzIHBhc3Npbmcg
LUVJTlZBTCBpbnN0ZWFkIG9mCm1hc3Rlci0+bnVtX2Nsa3MgdG8gZGV2X2Vycl9wcm9iZSgpIGJy
ZWFrIHByb2JlIGRlZmVycmFsPwoKZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmM6
c3ZjX2kzY19tYXN0ZXJfcHJvYmUoKSB7CgkuLi4KCW1hc3Rlci0+bnVtX2Nsa3MgPSBkZXZtX2Ns
a19idWxrX2dldF9hbGwoZGV2LCAmbWFzdGVyLT5jbGtzKTsKCWlmIChtYXN0ZXItPm51bV9jbGtz
IDwgMCkKCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIC1FSU5WQUwsICJjYW4ndCBnZXQgSTND
IGNsb2Nrc1xuIik7CgkuLi4KfQoKSWYgdGhlIGNsb2NrIHByb3ZpZGVyIGlzIG5vdCByZWFkeSBh
bmQgZGV2bV9jbGtfYnVsa19nZXRfYWxsKCkgcmV0dXJucwotRVBST0JFX0RFRkVSLCBwcm9iZSBm
YWlscyBwZXJtYW5lbnRseSB3aXRoIC1FSU5WQUwgaW5zdGVhZCBvZiBkZWZlcnJpbmcuCgo+IEBA
IC0yMTAxLDcgKzIxMDAsNiBAQCBzdGF0aWMgdm9pZCBzdmNfaTNjX21hc3Rlcl9yZW1vdmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCj4gIAlpM2NfbWFzdGVyX3VucmVnaXN0ZXIo
Jm1hc3Rlci0+YmFzZSk7Cj4gIAo+IC0JcG1fcnVudGltZV9kb250X3VzZV9hdXRvc3VzcGVuZCgm
cGRldi0+ZGV2KTsKPiAgCXBtX3J1bnRpbWVfZGlzYWJsZSgmcGRldi0+ZGV2KTsKPiAgfQoKW1Nl
dmVyaXR5OiBNZWRpdW1dCkRvZXMgcmVtb3ZpbmcgcG1fcnVudGltZV9kb250X3VzZV9hdXRvc3Vz
cGVuZCgpIGhlcmUgbGVhdmUgbWFzdGVyLT5jbGtzCnByZXBhcmVkIGFuZCBlbmFibGVkIGFuZCBw
aW5jdHJsIGluIHRoZSBhY3RpdmUgc3RhdGUgYWZ0ZXIgZHJpdmVyIHJlbW92YWw/CgppM2NfbWFz
dGVyX3VucmVnaXN0ZXIoKSBjYWxscyBpM2NfbWFzdGVyX2J1c19jbGVhbnVwKCkgLT4Kc3ZjX2kz
Y19tYXN0ZXJfYnVzX2NsZWFudXAoKSwgd2hpY2ggd2FrZXMgJnBkZXYtPmRldiB2aWEKcG1fcnVu
dGltZV9yZXN1bWVfYW5kX2dldCgpIGFuZCB0aGVuIGNhbGxzIHBtX3J1bnRpbWVfcHV0X2F1dG9z
dXNwZW5kKCkuCkJlY2F1c2UgYXV0b3N1c3BlbmQgaXMgZW5hYmxlZCB3aXRoIGEgMTAwMCBtcyBk
ZWxheSwgdGhhdCBjYWxsIG9ubHkgYXJtcwp0aGUgYXV0b3N1c3BlbmQgdGltZXIgYW5kIHJldHVy
bnMgd2l0aCAmcGRldi0+ZGV2IHN0aWxsIGFjdGl2ZSBhbmQKbWFzdGVyLT5jbGtzIGVuYWJsZWQu
CgpQcmV2aW91c2x5LCBjYWxsaW5nIHBtX3J1bnRpbWVfZG9udF91c2VfYXV0b3N1c3BlbmQoKSBi
ZWZvcmUKcG1fcnVudGltZV9kaXNhYmxlKCkgY2F1c2VkIHRoZSBydW50aW1lIFBNIGNvcmUgdG8g
c3luY2hyb25vdXNseSBydW4Kc3ZjX2kzY19ydW50aW1lX3N1c3BlbmQoKSwgd2hpY2ggZGlzYWJs
ZXMgYW5kIHVucHJlcGFyZXMgbWFzdGVyLT5jbGtzIGFuZApzZWxlY3RzIHRoZSBzbGVlcCBwaW5j
dHJsIHN0YXRlOgoKZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmM6c3ZjX2kzY19y
dW50aW1lX3N1c3BlbmQoKSB7CglzdHJ1Y3Qgc3ZjX2kzY19tYXN0ZXIgKm1hc3RlciA9IGRldl9n
ZXRfZHJ2ZGF0YShkZXYpOwoKCXN2Y19pM2Nfc2F2ZV9yZWdzKG1hc3Rlcik7CgljbGtfYnVsa19k
aXNhYmxlX3VucHJlcGFyZShtYXN0ZXItPm51bV9jbGtzLCBtYXN0ZXItPmNsa3MpOwoJcGluY3Ry
bF9wbV9zZWxlY3Rfc2xlZXBfc3RhdGUoZGV2KTsKCglyZXR1cm4gMDsKfQoKV2l0aCBwbV9ydW50
aW1lX2RvbnRfdXNlX2F1dG9zdXNwZW5kKCkgcmVtb3ZlZCwgcG1fcnVudGltZV9kaXNhYmxlKCkK
Y2FuY2VscyB0aGUgcGVuZGluZyBhdXRvc3VzcGVuZCB0aW1lciB3aXRob3V0IHJ1bm5pbmcKc3Zj
X2kzY19ydW50aW1lX3N1c3BlbmQoKSwgYW5kIHRoZSBsYXRlciBwbV9ydW50aW1lX3JlaW5pdCgp
IGluIHRoZSBkcml2ZXIKY29yZSBydW5zIGFmdGVyIHJ1bnRpbWUgUE0gaXMgYWxyZWFkeSBkaXNh
YmxlZC4KClsxXSBodHRwczovL3Nhc2hpa28uZGV2LyMvYnVnL2xpbnV4LTdmNmYzMGU2LTdkYzYt
NDI3Mi1iOWE3LWUwMzI2ZGI1MDFhMQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8v
c2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTEwNy1kb250LXVzZS1hdXRvc3VzcGVuZC1pM2Mt
djEtMC04MGExNTQ2MzU0Y2VAa2VybmVsLm9yZz9wYXJ0PTIKCi0tIApsaW51eC1pM2MgbWFpbGlu
ZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
