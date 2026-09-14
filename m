Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310E3C88E50
	for <linux-i3c@archiver.kernel.org>; Mon, 14 Sep 2026 11:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pvt55H+fq9jLseTm6uYMaMUblIEXaSFBDdQbDaE0X/g=; b=FmmUilLmLJx9pK
	F6Ma+60cxkGTcNzNK6R+izyYQnybTCF28td6BU0sqFXIu6P05UQS9rAhkHluSWrJETKMRQtJck1zf
	katvfafCtzXEFIxQ9I/HksWyi8C59/NK6dOEJpnn4LDkogA31ka1JHKivQ57S7pJb5LAEX8HsULmG
	asTZo71LoCggp4AgAXy8TNJZgoGzYH+ZFuzD8GU2oKSf/KHWgVCo0xnpkcmsnK9m15LjnskSnMZrV
	WHhrcoqniPvj8//liEb+KqFv3pWw7ztCIG3A9txuuuOvgLkw42yNX8krtQdsz7a0ArTBkTOpZXw7t
	tcpIQoRZcYJa3uzMgwQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65Bm-00000003Ngq-3pAc;
	Mon, 14 Sep 2026 11:49:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65Bl-00000003NgQ-08bN
	for linux-i3c@lists.infradead.org;
	Mon, 14 Sep 2026 11:49:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 90080433F9;
	Mon, 14 Sep 2026 11:49:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30B8C1F000FF;
	Mon, 14 Sep 2026 11:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789386572;
	bh=p8kt2G5P2t4BAuoUObewm+nJi9o9uNlKy9umssCQj5Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dpOVO2/QTmhFno7t0p8uNAB+IHo1KyzvN75wpnoX8h9FIgVqgKNIGgseKa8Vg1QGi
	 qOpULf2gyIimaJqZrCh98HdfqrOwVfvMM+6FZnAwhx3b/wThT4yxDYwRaCQ840obBR
	 oUOajt0dl3i549+YtFY3pXLeK2jDomFOGbwPwygNbivdf/tTWqfZsEsXg3220B+OyE
	 lv+zt9wflXlOlTIgBBBA0P011agUYVfSn8LhTvcsQ68mwbOrfwkPjjB1N8XFXPVW78
	 06x2dwFAYeC5pjCZmvNcX7ZP8Lc04+TLypbV/s6XVCdSMmYX2PziHE88TIw5K92FHN
	 4kDHyO5xahSsQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 13/17] i3c: mipi-i3c-hci: Remove invalid transfer size
 limit
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org, linux-i3c@lists.infradead.org
In-Reply-To: <20260914113003.183150-14-adrian.hunter@intel.com>
References: <20260914113003.183150-1-adrian.hunter@intel.com>
 <20260914113003.183150-14-adrian.hunter@intel.com>
Date: Mon, 14 Sep 2026 11:49:31 +0000
Message-Id: <20260914114932.30B8C1F000FF@smtp.kernel.org>
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
IFtIaWdoXSBPdXQtb2YtYm91bmRzIHdyaXRlIGluIGBoY2lfcGlvX2RvX3RyYWlsaW5nX3J4YCBk
dWUgdG8gdHJ1c3RpbmcgaGFyZHdhcmUtcHJvdmlkZWQgcmVzcG9uc2UgZGF0YSBsZW5ndGguCi0t
Cgpjb21taXQgM2FiODcxNWNkMmJiNjcxZDk1Y2Q4NTZlOTFhYzllYTAwNTgzZjU2NwpBdXRob3I6
IEFkcmlhbiBIdW50ZXIgPGFkcmlhbi5odW50ZXJAaW50ZWwuY29tPgoKaTNjOiBtaXBpLWkzYy1o
Y2k6IFJlbW92ZSBpbnZhbGlkIHRyYW5zZmVyIHNpemUgbGltaXQKClRoZSBkcml2ZXIgZGVyaXZl
cyBhIG1heGltdW0gdHJhbnNmZXIgc2l6ZSBmcm9tIEhDX0NBUF9NQVhfREFUQV9MRU5HVEggaW4K
SENfQ0FQQUJJTElUSUVTLCBidXQgbm8gcHVibGlzaGVkIHZlcnNpb24gb2YgdGhlIEkzQyBIQ0kg
c3BlY2lmaWNhdGlvbgpkZWZpbmVzIHN1Y2ggYSBmaWVsZC4gVGhpcyBjb21taXQgcmVtb3ZlcyB0
aGUgdW51c2VkIGNhcGFiaWxpdHkgZGVmaW5pdGlvbgphbmQgdGhlIGRlYWQgc2l6ZSBjaGVjay4K
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvY29yZS5jIGIv
ZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9jb3JlLmMKPiBpbmRleCBiOWIyMDc5N2Qw
NDU0Li40NjI5YTE2ZGViYzk4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci9taXBp
LWkzYy1oY2kvY29yZS5jCj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9j
b3JlLmMKWyAuLi4gXQo+IEBAIC00ODIsMTMgKzQ4MCw4IEBAIHN0YXRpYyBpbnQgaTNjX2hjaV9p
M2NfeGZlcnMoc3RydWN0IGkzY19kZXZfZGVzYyAqZGV2LAo+ICAJaWYgKCF4ZmVyKQo+ICAJCXJl
dHVybiAtRU5PTUVNOwo+ICAKPiAtCXNpemVfbGltaXQgPSAxVSA8PCAoMTYgKyBGSUVMRF9HRVQo
SENfQ0FQX01BWF9EQVRBX0xFTkdUSCwgaGNpLT5jYXBzKSk7Cj4gLQo+ICAJZm9yIChpID0gMDsg
aSA8IG54ZmVyczsgaSsrKSB7Cj4gIAkJeGZlcltpXS5kYXRhX2xlbiA9IGkzY194ZmVyc1tpXS5s
ZW47Cj4gLQkJcmV0ID0gLUVGQklHOwo+IC0JCWlmICh4ZmVyW2ldLmRhdGFfbGVuID49IHNpemVf
bGltaXQpCj4gLQkJCWdvdG8gb3V0OwoKW1NldmVyaXR5OiBIaWdoXQpUaGlzIGlzIGEgcHJlLWV4
aXN0aW5nIGlzc3VlLCBidXQgY291bGQgdGhpcyBsZWFkIHRvIGFuIG91dC1vZi1ib3VuZHMgd3Jp
dGUKZHVyaW5nIHJlc3BvbnNlIHByb2Nlc3Npbmc/CgpJZiB0aGUgSTNDIEhDSSBjb250cm9sbGVy
IGhhcmR3YXJlIHJldHVybnMgYSByZXNwb25zZSBkZXNjcmlwdG9yIHdpdGggYSBkYXRhCmxlbmd0
aCAoUkVTUF9EQVRBX0xFTkdUSCkgZ3JlYXRlciB0aGFuIHRoZSBvcmlnaW5hbGx5IHJlcXVlc3Rl
ZCBidWZmZXIgc2l6ZQpzdG9yZWQgaGVyZSBpbiB4ZmVyLT5kYXRhX2xlbiwgaXQgYXBwZWFycyB0
aGUgaGFyZHdhcmUtcHJvdmlkZWQgdmFsdWUgaXMKdHJ1c3RlZCB3aXRob3V0IGJlaW5nIGJvdW5k
ZWQuCgpJbiBkcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL3Bpby5jOmhjaV9waW9fcHJv
Y2Vzc19yZXNwKCk6CgogICAgcmVjZWl2ZWQgPSB4ZmVyLT5kYXRhX2xlbiAtIHhmZXItPmRhdGFf
bGVmdDsKICAgIGV4cGVjdGVkID0gUkVTUF9EQVRBX0xFTkdUSCh4ZmVyLT5yZXNwb25zZSk7CiAg
ICBpZiAoZXhwZWN0ZWQgPiByZWNlaXZlZCkgewogICAgICAgIGhjaV9waW9fZG9fdHJhaWxpbmdf
cngoaGNpLCBwaW8sIGV4cGVjdGVkIC0gcmVjZWl2ZWQpOwogICAgfQoKVGhpcyBsZWFkcyB0byBh
biBvdmVyc2l6ZWQgY291bnQgYmVpbmcgcGFzc2VkIHRvIGhjaV9waW9fZG9fdHJhaWxpbmdfcngo
KToKCmRyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvcGlvLmM6aGNpX3Bpb19kb190cmFp
bGluZ19yeCgpIHsKICAgIC4uLgogICAgaWYgKGNvdW50ID49IDQpIHsKICAgICAgICB1bnNpZ25l
ZCBpbnQgbnJfd29yZHMgPSBjb3VudCAvIDQ7CiAgICAgICAgLyogZXh0cmFjdCBkYXRhIGZyb20g
RklGTyAqLwogICAgICAgIHhmZXItPmRhdGFfbGVmdCAtPSBucl93b3JkcyAqIDQ7CiAgICAgICAg
ZGV2X2RiZygmaGNpLT5tYXN0ZXIuZGV2LCAibm93ICVkIGxlZnQgJWQiLAogICAgICAgICAgICBu
cl93b3JkcyAqIDQsIHhmZXItPmRhdGFfbGVmdCk7CiAgICAgICAgd2hpbGUgKG5yX3dvcmRzLS0p
CiAgICAgICAgICAgICpwKysgPSBwaW9fcmVnX3JlYWQoWEZFUl9EQVRBX1BPUlQpOwogICAgfQog
ICAgLi4uCn0KCldpbGwgdGhpcyB1bmNvbmRpdGlvbmFsbHkgcmVhZCB0aGUgZXh0cmEgYnl0ZXMg
ZnJvbSB0aGUgaGFyZHdhcmUgRklGTyBpbnRvCnRoZSBtZW1vcnkgcG9pbnRlZCB0byBieSBwLCBv
dmVyZmxvd2luZyB0aGUgeGZlci0+ZGF0YSBidWZmZXIgaWYgYSBmYXVsdHkKb3IgbWFsaWNpb3Vz
IHRhcmdldCBkZXZpY2UgaW5kdWNlcyB0aGUgbWFzdGVyIHRvIHJlYWQgbW9yZSBkYXRhIHRoYW4K
cmVxdWVzdGVkPwoKPiAgCQl4ZmVyW2ldLnJudyA9IGkzY194ZmVyc1tpXS5ybnc7Cj4gIAkJaWYg
KGkzY194ZmVyc1tpXS5ybncpIHsKPiAgCQkJeGZlcltpXS5kYXRhID0gaTNjX3hmZXJzW2ldLmRh
dGEuaW47CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3Bh
dGNoc2V0LzIwMjYwOTE0MTEzMDAzLjE4MzE1MC0xLWFkcmlhbi5odW50ZXJAaW50ZWwuY29tP3Bh
cnQ9MTMKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
aTNjCg==
