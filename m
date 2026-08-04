Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4F2C5518F
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Aug 2026 11:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dLA6Kg8+OrkP9saoETCLQnvRMvxsQm3f7rdopREyT4w=; b=sCqLCtBWv1AfJG
	d7TVOKi9rbCwV9y6eCUVBQpcNuttq8rtBU7DH0tKAEHJK7RTGFezTNZVi128NOMS5pbn89C9uaqaW
	2nL5JLz+KQCGGBdYe4MJcG8zx5/lCrMNIwWiVkoPenFxtJ+mkNF/auhddlRcX8Bn4lXdpZpXybA0i
	bK9lLurrVFOsXq7B7+ZTkh3jH2sCCM0HObP+UNWbF7FCBQqL+yt6lx75LpX1+4VcNoXGWnyI8EI/z
	L8qpVmtjcKUyjvU6RcPkNVqDtmQmR61tEhGY4bv11r8LyKt6sdKPdGAZtxsWib8baJ//PhywjJdPd
	jP/i/bCdj0Yp/05D4YrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrD7O-00000001ekG-3S6q;
	Tue, 04 Aug 2026 11:15:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrD7N-00000001ejq-1Une
	for linux-i3c@lists.infradead.org;
	Tue, 04 Aug 2026 11:15:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B8B1760A59;
	Tue,  4 Aug 2026 11:15:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4244F1F000E9;
	Tue,  4 Aug 2026 11:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785842132;
	bh=iXls+hnWa4zSgnL/yn6bQdSCYMtAhgVUC7eDNYwE5A8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CS6KYEQfRUl20KWiaxcHFmIQVIZQagZe+UcBD8SsKHR6bOlE6PTkR4B8wnFyHGEyy
	 7i7G10onylTG7XAujcekg/9uQTIYRTrQ4QAXrj4QnghH6YKR218lqVdX/6dkL5UnWq
	 M6fT8MCtcPVGoG83HU9BCHPZ4d5CI/sgGGLmPVjaiim2hLeNR2qG9TEE46StvWQI4S
	 0djQWNKAIaZn37kX8lTUwT6xZyskM9ZdRW9J2FsnhZRgZDTmwGPXkvn7mCL1+mczlf
	 Malex39tVRwkhN1DELmwMsyNSGB/fHOU9r0CvDc8GAJujqpk86S8wunTfwiyuqsMEm
	 y9h5hyk2XmjlA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] i3c: dw: Resume the controller before unregistering
 the bus
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org, Frank.Li@kernel.org
In-Reply-To: <20260804101301.2975911-6-akhilrajeev@nvidia.com>
References: <20260804101301.2975911-1-akhilrajeev@nvidia.com>
 <20260804101301.2975911-6-akhilrajeev@nvidia.com>
Date: Tue, 04 Aug 2026 11:15:31 +0000
Message-Id: <20260804111532.4244F1F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtIaWdoXSBJZiBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KCkgZmFpbHMsIHRoZSBkcml2ZXIg
bG9ncyBhbiBlcnJvciBidXQgcHJvY2VlZHMgdG8gdW5yZWdpc3RlciB0aGUgYnVzLCB3aGljaCBh
Y2Nlc3NlcyBoYXJkd2FyZSByZWdpc3RlcnMgd2hpbGUgY2xvY2tzIGFyZSBnYXRlZCwgY2F1c2lu
ZyBhIHN5c3RlbSBoYW5nLgotLQoKLS0tIFBhdGNoIFs1XTogW1BBVENIIDUvNV0gaTNjOiBkdzog
UmVzdW1lIHRoZSBjb250cm9sbGVyIGJlZm9yZSB1bnJlZ2lzdGVyaW5nIHRoZSBidXMgLS0tCmNv
bW1pdCA1MDVmMmYyYjY3NDI5Mjg2ZTg1Yzg2YTNhYWZhZTNiNWE4YTNhODc2CkF1dGhvcjogQWto
aWwgUiA8YWtoaWxyYWplZXZAbnZpZGlhLmNvbT4KCmkzYzogZHc6IFJlc3VtZSB0aGUgY29udHJv
bGxlciBiZWZvcmUgdW5yZWdpc3RlcmluZyB0aGUgYnVzCgpVbnJlZ2lzdGVyaW5nIHRoZSBJM0Mg
YnVzIHdpdGhvdXQgcmVzdW1pbmcgdGhlIGRldmljZSBhY2Nlc3NlcyByZWdpc3RlcnMKd2l0aCBn
YXRlZCBjbG9ja3MsIGNhdXNpbmcgc3lzdGVtIGhhbmdzLiBUaGlzIGNvbW1pdCByZXN1bWVzIHRo
ZSBkZXZpY2UKYXJvdW5kIHVucmVnaXN0cmF0aW9uIHRvIGVuc3VyZSB0aGUgY2xvY2tzIGFyZSBy
dW5uaW5nIGZvciByZWdpc3RlciBhY2Nlc3Nlcy4KCkNsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsLzIwMjYwNzI4MDcxNzU3LjVCM0NEMUYwMDBFOUBzbXRwLmtlcm5lbC5vcmcvCgot
LS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jCisrKyBiL2RyaXZlcnMvaTNj
L21hc3Rlci9kdy1pM2MtbWFzdGVyLmMKQEAgLTE3MjMsOCArMTcyMywyMCBAQCBFWFBPUlRfU1lN
Qk9MX0dQTChkd19pM2NfY29tbW9uX3Byb2JlKTsKIAogdm9pZCBkd19pM2NfY29tbW9uX3JlbW92
ZShzdHJ1Y3QgZHdfaTNjX21hc3RlciAqbWFzdGVyKQogeworCWludCByZXQ7CisKKwkvKiBVbnJl
Z2lzdGVyaW5nIHRoZSBidXMgYWNjZXNzZXMgdGhlIGNvbnRyb2xsZXIgcmVnaXN0ZXJzICovCisJ
cmV0ID0gcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldChtYXN0ZXItPmRldik7CisJaWYgKHJldCA8
IDApCisJCWRldl9lcnIobWFzdGVyLT5kZXYsCisJCQkiPCVzPiBjYW5ub3QgcmVzdW1lIGkzYyBi
dXMgbWFzdGVyLCBlcnI6ICVkXG4iLAorCQkJX19mdW5jX18sIHJldCk7CisKIAlpM2NfbWFzdGVy
X3VucmVnaXN0ZXIoJm1hc3Rlci0+YmFzZSk7CgpbU2V2ZXJpdHk6IEhpZ2hdClRoaXMgaXMgYSBw
cmUtZXhpc3RpbmcgaXNzdWUsIGJ1dCBpZiBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KCkgZmFp
bHMgaGVyZSwKd2lsbCB0aGUgZHJpdmVyIHN0aWxsIHByb2NlZWQgdG8gY2FsbCBpM2NfbWFzdGVy
X3VucmVnaXN0ZXIoKT8KCklmIHRoZSByZXN1bWUgZmFpbHMgKGZvciBleGFtcGxlLCBkdWUgdG8g
YSBwb3dlciBkb21haW4gb3IgY2xvY2sgZW5hYmxlbWVudApmYWlsdXJlKSwgdGhlIGNsb2NrcyBy
ZW1haW4gZ2F0ZWQuIENhbGxpbmcgaTNjX21hc3Rlcl91bnJlZ2lzdGVyKCkgd2lsbAp1bmNvbmRp
dGlvbmFsbHkgaW52b2tlIHRoZSBjbGVhbnVwIHBhdGg6Cgpkd19pM2NfY29tbW9uX3JlbW92ZSgp
CiAgIGkzY19tYXN0ZXJfdW5yZWdpc3RlcigpCiAgICAgIGkzY19tYXN0ZXJfYnVzX2NsZWFudXAo
KQogICAgICAgICBkd19pM2NfbWFzdGVyX2Rpc2FibGUoKQoKSW5zaWRlIGR3X2kzY19tYXN0ZXJf
ZGlzYWJsZSgpLCB0aGUgY29kZSB3aWxsIGF0dGVtcHQgdG8gcmVhZCB0aGUgREVWSUNFX0NUUkwK
cmVnaXN0ZXIgd2hpbGUgdGhlIGhhcmR3YXJlIGlzIHN0aWxsIHVuY2xvY2tlZC4gCgpDb3VsZCB0
aGlzIGxlYWQgdG8gdGhlIHNhbWUgc3lzdGVtIGNyYXNoIChzdWNoIGFzIGEgRGF0YSBBYm9ydCkg
dGhhdCB0aGlzCnBhdGNoIGlzIHRyeWluZyB0byBwcmV2ZW50IGJ5IGFjY2Vzc2luZyBtZW1vcnkt
bWFwcGVkIHJlZ2lzdGVycyBvZiB0aGUKcG93ZXItZ2F0ZWQgaGFyZHdhcmUgYmxvY2s/Cgo+ICsJ
aWYgKHJldCA+PSAwKQo+ICsJCXBtX3J1bnRpbWVfcHV0X25vaWRsZShtYXN0ZXItPmRldik7Cj4g
Kwo+ICAJLyogQmFsYW5jZSBwbV9ydW50aW1lX2dldF9ub3Jlc3VtZSgpIGZyb20gcHJvYmUoKSAq
Lwo+ICAJaWYgKG1hc3Rlci0+cXVpcmtzICYgRFdfSTNDX0RJU0FCTEVfUlVOVElNRV9QTV9RVUlS
SykKCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hz
ZXQvMjAyNjA4MDQxMDEzMDEuMjk3NTkxMS0xLWFraGlscmFqZWV2QG52aWRpYS5jb20/cGFydD01
CgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
