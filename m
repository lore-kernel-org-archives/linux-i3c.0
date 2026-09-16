Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA3C2C88E77
	for <linux-i3c@archiver.kernel.org>; Wed, 16 Sep 2026 07:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3gR6dx6Fp2OUj5pJFsjBM1ICKXrJbLzF4zodJYUOBtk=; b=cxqul6dJl9vicY
	baVriKyGY5qpIHg6a/+uGVa2IucsFEs0y6WOugEE62WJ0rafm6EnLy6fTJg101CLDBkkvXyN+SW3T
	AGK4MBxBIg547CjKS2IjiAjm5Fk+9uyv5ntsjBYoNPuU/tsREMg0q1++txlNI2Cy6a1YAmjX7/Tuc
	WLeO3u4jrUdV/3LA/utPoUx9fqdFyWjDys3raopeb51Qc08C1XpBkpzpG3MURb06XMvRWLdbya3jL
	Fm9iACsiox/2n1zBNdcxRltnqj5NH+YB21VXXBb0vqzUEGWw7XrLMlRcVfYUvlp+nrwXyNGiPcNxZ
	3FDiRNA9vFwERgFULDHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6k1m-00000008aIL-48pf;
	Wed, 16 Sep 2026 07:25:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6k1m-00000008aID-05lJ
	for linux-i3c@lists.infradead.org;
	Wed, 16 Sep 2026 07:25:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 30E146020C;
	Wed, 16 Sep 2026 07:25:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 770B91F000FF;
	Wed, 16 Sep 2026 07:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789543556;
	bh=1PfFTsIevggcVqLRkFwiay2Rq202T00HsUqDekTEDpY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ln+SPFS/pBjcIRe3GZz7svXkHRWa4ND7JTL/drJrX18AS4ROuJW3FPvjaDsqNiB+I
	 tSbWENRqBQkhrXHC/1+ZMggoRVheFNvSMmZD11646PJaMjIEBLNKeWCv3IK9bK9g4/
	 Mja9nYTrpVOPzDQt7yKwyCSECqB7cf7cALXOj2bwK5JbyrRRPTjfRiT/V/Xcw3MUMA
	 GDtsu2a9Klq+gvR7E4DO39twVKwA1k+dhjwf+3Rg/ceuiIGegfbC6QKj7cPEMwMUMf
	 m6QWKa5sa0smP1sHUkpFakGdxQvoDmj1Lx4Lpd+k8z9KTXaXckPUkEqZlxF631aZqV
	 PZsI6qgw6d5jA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 8/8] i3c: hub: p3h2x4x: Add SMBus slave mode support
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260916070728.1088801-9-lakshay.piplani@nxp.com>
References: <20260916070728.1088801-1-lakshay.piplani@nxp.com>
 <20260916070728.1088801-9-lakshay.piplani@nxp.com>
Date: Wed, 16 Sep 2026 07:25:55 +0000
Message-Id: <20260916072556.770B91F000FF@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIGkzYzogcDNoMng0eDog
bG9zdCBTTUJ1cyBwYXlsb2FkcyBpbiBwM2gyeDR4X2liaV9oYW5kbGVyKCkgZHVlIHRvIHN0YXR1
cyBmbGFnIHJhY2UKLS0KCmNvbW1pdCBhMzgyOTY4ZWU2YzU4YmJiOWM2YTZlZTc3NGFmODFiYjM1
MWYyZjQ2CkF1dGhvcjogTGFrc2hheSBQaXBsYW5pIDxsYWtzaGF5LnBpcGxhbmlAbnhwLmNvbT4K
CmkzYzogaHViOiBwM2gyeDR4OiBBZGQgU01CdXMgc2xhdmUgbW9kZSBzdXBwb3J0CgpUaGlzIGNv
bW1pdCBhZGRzIFNNQnVzIHNsYXZlIG1vZGUgc3VwcG9ydCBmb3IgdGhlIFAzSDJ4NHggaHViIFNN
QnVzIHRhcmdldApwb3J0cy4gVGhlIGh1YiBTTUJ1cyBzbGF2ZSBhZ2VudCBjYW4gbm93IHJlY2Vp
dmUgZG93bnN0cmVhbSBwYXlsb2FkcyBpbnRvCnRhcmdldCBidWZmZXJzIGFuZCByZXBvcnQgcmVj
ZWl2ZSBldmVudHMgdGhyb3VnaCBJQkkuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9odWIv
cDNoMjg0MF9pM2NfaHViX3NtYnVzLmMgYi9kcml2ZXJzL2kzYy9odWIvcDNoMjg0MF9pM2NfaHVi
X3NtYnVzLmMKPiBpbmRleCBhMzMyNGNjMzY1OTU2Li43ZmRmYTc5ZGZlYjZjIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvaTNjL2h1Yi9wM2gyODQwX2kzY19odWJfc21idXMuYwo+ICsrKyBiL2RyaXZl
cnMvaTNjL2h1Yi9wM2gyODQwX2kzY19odWJfc21idXMuYwpbIC4uLiBdCj4gQEAgLTE1LDYgKzE3
LDE3OCBAQCBlbnVtIHAzaDJ4NHhfc21idXNfZGVzY19pZHggewpbIC4uLiBdCj4gK3ZvaWQgcDNo
Mng0eF9pYmlfaGFuZGxlcihzdHJ1Y3QgaTNjX2RldmljZSAqaTNjZGV2LAo+ICsJCQkgY29uc3Qg
c3RydWN0IGkzY19pYmlfcGF5bG9hZCAqcGF5bG9hZCkKPiArewpbIC4uLiBdCj4gKwkJLyogcHJv
Y2VzcyBkYXRhIHJlY2VpdmUgYnVmZmVyICovCj4gKwkJc3dpdGNoIChGSUVMRF9HRVQoQlVGX1JF
Q0VJVkVEX0ZMQUdfTUFTSywgdGFyZ2V0X3BvcnRfc3RhdHVzKSkgewpbIC4uLiBdCj4gKwkJY2Fz
ZSBQM0gyWDRYX1RBUkdFVF9CVUZfT1ZSRkxfVkFMOgo+ICsJCQlwM2gyeDR4X3JlYWRfc21idXNf
YWdlbnRfcnhfYnVmKGkzY2RldiwgUkNWX0JVRl8wLCBpKTsKPiArCQkJcDNoMng0eF9yZWFkX3Nt
YnVzX2FnZW50X3J4X2J1ZihpM2NkZXYsIFJDVl9CVUZfMSwgaSk7Cj4gKwkJCXJlZ21hcF93cml0
ZShwM2gyeDR4X2kzY19odWItPnJlZ21hcCwgUDNIMlg0WF9UUDBfU01CVVNfQUdOVF9TVFMgKyBp
LAo+ICsJCQkJICAgICBQM0gyWDRYX1RBUkdFVF9CVUZfT1ZSRkwpOwoKW1NldmVyaXR5OiBIaWdo
XQpDb3VsZCB0aGlzIHNpbGVudGx5IGRyb3AgU01CdXMgcGF5bG9hZHMgZHVlIHRvIGEgc3RhdHVz
IGZsYWcgcmFjZT8KCldoZW4gYW4gb3ZlcmZsb3cgb2NjdXJzLCB0aGlzIGJsb2NrIHNlcXVlbnRp
YWxseSByZWFkcyBhbmQgY2xlYXJzIHRoZSByZWNlaXZlCmZsYWdzIGZvciBib3RoIGJ1ZmZlciAw
IGFuZCBidWZmZXIgMSB2aWEgcDNoMng0eF9yZWFkX3NtYnVzX2FnZW50X3J4X2J1ZigpLgoKT25j
ZSBidWZmZXIgMCBpcyByZWFkIGFuZCBpdHMgaW5kaXZpZHVhbCBmbGFnIChiaXQgMSkgaXMgY2xl
YXJlZCwgdGhlCmhhcmR3YXJlIGNhbiBpbW1lZGlhdGVseSByZWNlaXZlIGEgbmV3bHkgYXJyaXZp
bmcgU01CdXMgbWVzc2FnZSBpbnRvIGJ1ZmZlciAwLApzZXR0aW5nIGJpdCAxIGFnYWluLgoKVGhl
IGhhbmRsZXIgdGhlbiBleHBsaWNpdGx5IGNsZWFycyB0aGUgb3ZlcmZsb3cgY29uZGl0aW9uIGJ5
IHdyaXRpbmcKUDNIMlg0WF9UQVJHRVRfQlVGX09WUkZMICh3aGljaCBpcyBHRU5NQVNLKDMsIDEp
KSB0byB0aGUgd3JpdGUtMS10by1jbGVhcgpzdGF0dXMgcmVnaXN0ZXIuIEJlY2F1c2UgdGhpcyBt
YXNrIGVuY29tcGFzc2VzIGJpdHMgMSwgMiwgYW5kIDMsIHdyaXRpbmcgaXQKY2xvYmJlcnMgdGhl
IGluZGl2aWR1YWwgYnVmZmVyIHJlY2VpdmUgZmxhZ3MgdGhhdCBtaWdodCBoYXZlIGp1c3QgYmVl
biBzZXQgYnkKbmV3IGluY29taW5nIG1lc3NhZ2VzLCBjbGVhcmluZyB0aGVtIHdpdGhvdXQgcmVh
ZGluZyB0aGUgZGF0YS4KCj4gKwkJCWRldl9lcnIoJmkzY2Rldi0+ZGV2LCAiT3ZlcmZsb3csIHJl
YWRpbmcgYnVmZmVyIHplcm8gYW5kIG9uZVxuIik7Cj4gKwkJCWJyZWFrOwpbIC4uLiBdCgotLSAK
U2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYw
OTE2MDcwNzI4LjEwODg4MDEtMS1sYWtzaGF5LnBpcGxhbmlAbnhwLmNvbT9wYXJ0PTgKCi0tIAps
aW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
