Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5C9606A33A
	for <linux-i3c@archiver.kernel.org>; Sun,  8 Nov 2026 09:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KGSkp2+h;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mLmdiKzq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5OqKIRl+7M77Ki+8pdMbYaqZ6bpJdEh4epoSIVkZmfg=; b=KGSkp2+hi8R+eYYzXY/TsoCx1W
	xpJ2KPma0CtjZy4Izf+G49Jxj4FuWFU+ES4up+7ncZsS/S9x7C/3yaZFMJJsu8Yj/AjM59WhbwnQh
	ZSpxKTFA930PugLiyXmOWIfbTB+MsohRED7IaXQ9gng0iIte1sNbMtw7cfiJ3bUjpRdDL+lx9OkO0
	Y9Ci3p2BeRxNFIORTIQ5gpYGPVmky7BSAUA1fO7zmuUxoAZIoUo8Gzxu/ExbCS69nLO8DLehPjp2P
	McgaMdf8/EjMBYTRy52r2JXiI0vANpNn6Ngrh7jnpOdgbbb0KfuXHigf8mq0YjPx6DaAs0F653s/Y
	TJKiDssQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPzP0-0000000FvIo-2qqR;
	Sun, 08 Nov 2026 09:41:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPzP0-0000000FvIL-1LyZ
	for linux-i3c@lists.infradead.org;
	Sun, 08 Nov 2026 09:41:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F82F44CF6;
	Sun,  8 Nov 2026 09:41:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 443551F0089F;
	Sun,  8 Nov 2026 09:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794130889;
	bh=hailAFEere05XaLEtW+K2dcRnnW8DUnYrhy+8jgWlGc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mLmdiKzqfk2XFc35XFyGJS8NP7NtXC283eodanQJKat1/Iel3nA/m+M/f664B9WvN
	 OGqShWzOdWvwUlPJ4xN1L+zscu5iSHFdGEfyBc6aiN+ue1QKx6M4r+hnpy40F8XLJV
	 XgQxwW0Fkjx3ES6JdElpmKlhzVO6aSI691eqk6vWj6qFp4kSbTXMsiuYn9mJlN1Hvj
	 mIqk7HJVpkEO+HfjjtHzGQJ9R3JkXUj4Rf2OVoxC4dx34efYnGhkbm1cJkEqOJ76S4
	 JRFw3HMLIg9imgoS0RcYThBk5noZhgjIv/Njl3nsOdj+xbO6qSoKVFlCGDPjgAHX8E
	 x5JDd/L4wDsRA==
Message-ID: <sashiko-outbox-203661@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] i3c: master: Fix fwnode reference leak in
 i3c_master_register_fwnode()
To: "Wentao Liang" <vulab@iscas.ac.cn>, linux-i3c@lists.infradead.org
Cc: Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20261108092920.314161-1-vulab@iscas.ac.cn>
References: <20261108092920.314161-1-vulab@iscas.ac.cn>
Date: Sun, 08 Nov 2026 09:41:28 +0000
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
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0xvd10gaTNjOiBtYXN0ZXI6IHdyb25n
IEZpeGVzIHRyYWlsZXIgaW4gY29tbWl0IG1lc3NhZ2UgZm9yCiAgaTNjX21hc3Rlcl9ycG1fZ2V0
KCkKLS0KCmNvbW1pdCBiYTAxYWVlZmFlZGE4OTk2ODJlYTI2ZGZjMDIzMzBkNjFkNjMzMDBhCkF1
dGhvcjogV2VudGFvIExpYW5nIDx2dWxhYkBpc2Nhcy5hYy5jbj4KCj4gaTNjOiBtYXN0ZXI6IEZp
eCBmd25vZGUgcmVmZXJlbmNlIGxlYWsgaW4gaTNjX21hc3Rlcl9yZWdpc3Rlcl9md25vZGUoKQo+
Cj4gaTNjX21hc3Rlcl9yZWdpc3Rlcl9md25vZGUoKSB0YWtlcyBhIHJlZmVyZW5jZSBvbiB0aGUg
YnVzIGZpcm13YXJlIG5vZGUKPiB3aXRoIGZ3bm9kZV9oYW5kbGVfZ2V0KCkgYW5kIHN0b3JlcyBp
dCBpbiBtYXN0ZXItPmRldi4gVGhhdCByZWZlcmVuY2UgaXMKPiBub3JtYWxseSBkcm9wcGVkIGJ5
IGkzY19tYXN0ZXJkZXZfcmVsZWFzZSgpLCB3aGljaCBydW5zIHdoZW4gdGhlIGxhc3QKPiByZWZl
cmVuY2Ugb24gdGhlIG1hc3RlciBkZXZpY2UgaXMgcHV0Lgo+Cj4gSWYgaTNjX21hc3Rlcl9ycG1f
Z2V0KCkgZmFpbHMsIHRoZSBmdW5jdGlvbiByZXR1cm5zIGJlZm9yZQo+IGRldmljZV9pbml0aWFs
aXplKCksIHNvIHB1dF9kZXZpY2UoKSBpcyBuZXZlciBjYWxsZWQsIHRoZSByZWxlYXNlCj4gY2Fs
bGJhY2sgbmV2ZXIgcnVucywgYW5kIHRoZSByZWZlcmVuY2UgaXMgbGVha2VkLgo+Cj4gUmVsZWFz
ZSB0aGUgcmVmZXJlbmNlIGV4cGxpY2l0bHkgb24gdGhhdCBwYXRoLiBvZl9ub2RlX3B1dCgpIGlz
IG5vdAo+IGVub3VnaCBoZXJlOiBpdCBvbmx5IGFjdHMgb24gT3BlbiBGaXJtd2FyZSBub2Rlcywg
c28gdGhlIHJlZmVyZW5jZSB3b3VsZAo+IHN0aWxsIGxlYWsgb24gQUNQSSBhbmQgc29mdHdhcmUg
bm9kZSBzeXN0ZW1zLgo+Cj4gVGhlIGNhbmRpZGF0ZSB3YXMgZm91bmQgd2l0aCBzdGF0aWMgYW5h
bHlzaXMgdG9vbHM7IERlZXBTZWVrIGFuZCBHUFQtNi4xCj4gU29sIHdlcmUgdXNlZCB0byBhdWRp
dCBpdCBhbmQgdG8gaGVscCBwcmVwYXJlIHRoaXMgZml4Lgo+Cj4gRml4ZXM6IDNhMzc5YmJjZWEw
YSAoImkzYzogQWRkIGNvcmUgSTNDIGluZnJhc3RydWN0dXJlIikKPiBTaWduZWQtb2ZmLWJ5OiBX
ZW50YW8gTGlhbmcgPHZ1bGFiQGlzY2FzLmFjLmNuPgoKW1NldmVyaXR5OiBMb3ddClNob3VsZCB0
aGUgRml4ZXM6IHRhZyByZWZlcmVuY2UgOTkwYzE0OWM2MWVlICgiaTNjOiBtYXN0ZXI6IEludHJv
ZHVjZQpvcHRpb25hbCBSdW50aW1lIFBNIHN1cHBvcnQiKSBpbnN0ZWFkPwoKVGhlIG9yaWdpbmFs
IGVycm9yIHJldHVybiBiZWZvcmUgZGV2aWNlX2luaXRpYWxpemUoKSBpbiAzYTM3OWJiY2VhMGEK
KCJpM2M6IEFkZCBjb3JlIEkzQyBpbmZyYXN0cnVjdHVyZSIpIHdhcyBmaXhlZCBieSA5ZDRmMjE5
ODA3ZDUgKCJpM2M6IGZpeApyZWZjb3VudCBpbmNvbnNpc3RlbmN5IGluIGkzY19tYXN0ZXJfcmVn
aXN0ZXIiKSwgd2hpbGUgOTkwYzE0OWM2MWVlCigiaTNjOiBtYXN0ZXI6IEludHJvZHVjZSBvcHRp
b25hbCBSdW50aW1lIFBNIHN1cHBvcnQiKSBhZGRlZCB0aGUKaTNjX21hc3Rlcl9ycG1fZ2V0KCkg
Y2FsbCBiZWZvcmUgZGV2aWNlX2luaXRpYWxpemUoKS4KCi0tIApTYXNoaWtvIEFJIHJldmlldyDC
tyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjExMDgwOTI5MjAuMzE0MTYxLTEt
dnVsYWJAaXNjYXMuYWMuY24/cGFydD0xCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51
eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
