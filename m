Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52004C982C9
	for <linux-i3c@archiver.kernel.org>; Wed, 16 Sep 2026 16:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RErYURhxCuv07d/0UCoUNwAOJLVY39KdL19gk7qxSRg=; b=MRi6CP5OV+P/GI
	Zwq9H95dtTFJUV7Awn1JTWPmOQpg9IFUtqQ8KdMw76KPi9ZMCLJn1TRu3YPHyy7DwYs5SLvPR8Ruy
	U6C11WW/oT51Wg/1DrUpRcBnZA00Ttcbh1+c4SDj3G9rDwF+iCk/4Yr1zXgz6Up2M9lz4R6CXzn4k
	cUg6jdNzP4DiLwcR0uOG9A9WfOBB1Vt+9EM3KyIEB0l+IZ5oIUO0WT3HibLblaNAojC/mjsKLI3aJ
	etSTEHgpmS5MJGNpPh5FJGes0OaPwito9zo+MNS3pqoYEj4LmdN8jhAn9xJUqDk+gbByAcR3+vb6A
	OwA6kwD+AVJc91ERPpzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6sJ1-00000009iC9-04K6;
	Wed, 16 Sep 2026 16:16:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6sIz-00000009iC3-3osP
	for linux-i3c@lists.infradead.org;
	Wed, 16 Sep 2026 16:16:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0914B602CC;
	Wed, 16 Sep 2026 16:16:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B6B31F000FF;
	Wed, 16 Sep 2026 16:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789575376;
	bh=7TZMZGmq32NeGqAkoYqe1VdMy1z1oyCQvrjgxM2Wug4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GNPnNHc88w7MXldwKJla8FmuDz7+tQW/h14FEMntrE0edzk1ctDJH04TGGlqiSwNT
	 f/tccjmVQHbBp3ia7SL2jGX0T4zfEnwdnWNwGyq8m/ey/hEc5TE6284iHQCOhV3eV0
	 xUlFYGmZz7/WBBZwnvs3/Tc1Rf1HC77F2MBjKHYRGV04XRuN/ffJg/sCGdJl4rAOlW
	 SquTkpO3bOXkc5Elh44NFQ1DXM8VphLgStAD7q2Cg4g7B4J2HOh88ixY2jeH8rDO1y
	 xY+4TDKuZbXVQ71VrBEuFRJ8JeyZrDUMrZEKZKOV7DBRiCkEUSZnVXK3BZcjlMdk3l
	 Vbe0ci7eyHNoQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] i3c: master: Fix of_node reference leak in
 i3c_master_register()
To: "Wentao Liang" <vulab@iscas.ac.cn>
Cc: Frank.Li@kernel.org, linux-i3c@lists.infradead.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260916160358.2081087-1-vulab@iscas.ac.cn>
References: <20260916160358.2081087-1-vulab@iscas.ac.cn>
Date: Wed, 16 Sep 2026 16:16:15 +0000
Message-Id: <20260916161616.7B6B31F000FF@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gaTNjOiBBUEkgbWlz
bWF0Y2ggaW4gZXJyb3IgcGF0aCBsZWF2ZXMgZndub2RlIHJlZmVyZW5jZSBsZWFrZWQgb24gQUNQ
SQotLQoKY29tbWl0IGIxZTU5YTMxNDM3MTQ0NjY4YjFmYjE1MWZjZGNiNDM1OWU3OTY2MTAKQXV0
aG9yOiBXZW50YW8gTGlhbmcgPHZ1bGFiQGlzY2FzLmFjLmNuPgoKaTNjOiBtYXN0ZXI6IEZpeCBv
Zl9ub2RlIHJlZmVyZW5jZSBsZWFrIGluIGkzY19tYXN0ZXJfcmVnaXN0ZXIoKQoKVGhpcyBjb21t
aXQgYXR0ZW1wdHMgdG8gZml4IGEgbm9kZSByZWZlcmVuY2UgbGVhayBpbiB0aGUgZXJyb3IgcGF0
aCBvZgppM2NfbWFzdGVyX3JlZ2lzdGVyKCkgd2hlbiBpM2NfbWFzdGVyX3JwbV9nZXQoKSBmYWls
cy4gSXQgZHJvcHMgdGhlIHJlZmVyZW5jZQpiZWZvcmUgZGV2aWNlX2luaXRpYWxpemUoKSBpcyBj
YWxsZWQuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYyBiL2RyaXZlcnMvaTNj
L21hc3Rlci5jCj4gaW5kZXggYWZjZDdhMjFhM2U2Ni4uMTkwOWQ0MDM4Nzg3OSAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYwo+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci5jCj4g
QEAgLTM2ODUsOCArMzY4NSwxMCBAQCBpbnQgaTNjX21hc3Rlcl9yZWdpc3RlcihzdHJ1Y3QgaTNj
X21hc3Rlcl9jb250cm9sbGVyICptYXN0ZXIsCj4gIAlJTklUX0xJU1RfSEVBRCgmbWFzdGVyLT5i
b2FyZGluZm8uaTNjKTsKPiAgCj4gIAlyZXQgPSBpM2NfbWFzdGVyX3JwbV9nZXQobWFzdGVyKTsK
PiAtCWlmIChyZXQpCj4gKwlpZiAocmV0KSB7Cj4gKwkJb2Zfbm9kZV9wdXQobWFzdGVyLT5kZXYu
b2Zfbm9kZSk7CgpbU2V2ZXJpdHk6IE1lZGl1bV0KRG9lcyB0aGlzIGNvZGUgY29ycmVjdGx5IHJl
bGVhc2UgdGhlIGZ3bm9kZSByZWZlcmVuY2Ugb24gbm9uLURUIHN5c3RlbXMgbGlrZQpBQ1BJPwoK
VGhlIG5vZGUgZm9yIG1hc3Rlci0+ZGV2IGlzIGFjcXVpcmVkIGVhcmxpZXIgaW4gaTNjX21hc3Rl
cl9yZWdpc3RlcigpIAp1c2luZyB0aGUgZ2VuZXJpYyBmd25vZGUgQVBJOgoKCWRldmljZV9zZXRf
bm9kZSgmbWFzdGVyLT5kZXYsIGZ3bm9kZV9oYW5kbGVfZ2V0KGRldl9md25vZGUocGFyZW50KSkp
OwoKU2luY2Ugb2Zfbm9kZV9wdXQoKSBvbmx5IG9wZXJhdGVzIG9uIE9wZW4gRmlybXdhcmUgbm9k
ZXMsIHdvbid0IHRoaXMgcmVzdWx0IGluCmEgbGVha2VkIHJlZmVyZW5jZSBvbiBwbGF0Zm9ybXMg
dXRpbGl6aW5nIEFDUEkgb3Igc29mdHdhcmUgbm9kZXM/CgpTaG91bGQgdGhpcyB1c2UgZndub2Rl
X2hhbmRsZV9wdXQoZGV2X2Z3bm9kZSgmbWFzdGVyLT5kZXYpKSBpbnN0ZWFkLCBtYXRjaGluZwp0
aGUgY2xlYW51cCBzZXF1ZW5jZSBpbXBsZW1lbnRlZCBpbiBpM2NfbWFzdGVyZGV2X3JlbGVhc2Uo
KT8KCj4gIAkJcmV0dXJuIHJldDsKPiArCX0KPiAgCj4gIAlkZXZpY2VfaW5pdGlhbGl6ZSgmbWFz
dGVyLT5kZXYpOwo+CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRl
di8jL3BhdGNoc2V0LzIwMjYwOTE2MTYwMzU4LjIwODEwODctMS12dWxhYkBpc2Nhcy5hYy5jbj9w
YXJ0PTEKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
aTNjCg==
