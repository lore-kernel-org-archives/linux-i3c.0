Return-Path: <SRS0=EHny=QX=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1778DC43381
	for <linux-i3c@archiver.kernel.org>; Sat, 16 Feb 2019 16:30:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3D50222E0
	for <linux-i3c@archiver.kernel.org>; Sat, 16 Feb 2019 16:30:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZFfrvjKL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3D50222E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yDyV6dVhPO01S/2468ztT3Kv4pBk7FcE53AsT7U/rPQ=; b=ZFfrvjKLPT+qV+
	S7jNJkuG0HvEwQZTcYUe24M29nhyrN4eU+Xk/aNS8AYWzkdyUZMriC52XbW1MRmw6hQKRtgQ1PHEI
	L2oFA6vwALRR3AQ2AqZmFS6FhXhofs6cMFfuBx39PRWbL6EBbJyDluuJz5yeQcS7rvU4U/0LiA7nd
	PRER/HiaPqO+R83LJnY6H34D95ikYCi3oprDPqLNV19PuLMyWFcRmMARkMm+ZLo8kvOrrASI/ZfBP
	3XjGF+BLYEJLMasSuYtz7vq1a6ybYS/h6sQyTmkfqaRk80dy13KPnPCALyBgWr5PZV74G0zla71xy
	rD4tU2O+ptOBIi3aWBuw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gv2rY-00080Z-7K; Sat, 16 Feb 2019 16:30:48 +0000
Received: from gateway23.websitewelcome.com ([192.185.48.84])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtJqC-0004qn-An
 for linux-i3c@lists.infradead.org; Mon, 11 Feb 2019 22:14:17 +0000
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
 by gateway23.websitewelcome.com (Postfix) with ESMTP id 2FCDF19584
 for <linux-i3c@lists.infradead.org>; Mon, 11 Feb 2019 16:14:15 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id tJqBgRMjw2PzOtJqBgwM1x; Mon, 11 Feb 2019 16:14:15 -0600
X-Authority-Reason: nr=8
Received: from [189.250.119.20] (port=59992 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.91)
 (envelope-from <gustavo@embeddedor.com>)
 id 1gtJqA-0046sS-D5; Mon, 11 Feb 2019 16:14:14 -0600
Date: Mon, 11 Feb 2019 16:14:13 -0600
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Vitor Soares <vitor.soares@synopsys.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Subject: [PATCH] i3c: master: dw-i3c-master: mark expected switch fall-through
Message-ID: <20190211221413.GA21822@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.250.119.20
X-Source-L: No
X-Exim-ID: 1gtJqA-0046sS-D5
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [189.250.119.20]:59992
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 13
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190211_141416_411820_863F56C7 
X-CRM114-Status: UNSURE (   5.22  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Sat, 16 Feb 2019 08:30:46 -0800
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

SW4gcHJlcGFyYXRpb24gdG8gZW5hYmxpbmcgLVdpbXBsaWNpdC1mYWxsdGhyb3VnaCwgbWFyayBz
d2l0Y2gKY2FzZXMgd2hlcmUgd2UgYXJlIGV4cGVjdGluZyB0byBmYWxsIHRocm91Z2guCgpUaGlz
IHBhdGNoIGZpeGVzIHRoZSBmb2xsb3dpbmcgd2FybmluZzoKCmRyaXZlcnMvaTNjL21hc3Rlci9k
dy1pM2MtbWFzdGVyLmM6IEluIGZ1bmN0aW9uIOKAmGR3X2kzY19tYXN0ZXJfYnVzX2luaXTigJk6
CmRyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmM6NjAzOjY6IHdhcm5pbmc6IHRoaXMg
c3RhdGVtZW50IG1heSBmYWxsIHRocm91Z2ggWy1XaW1wbGljaXQtZmFsbHRocm91Z2g9XQogICBp
ZiAocmV0KQogICAgICBeCmRyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmM6NjA1OjI6
IG5vdGU6IGhlcmUKICBjYXNlIEkzQ19CVVNfTU9ERV9QVVJFOgogIF5+fn4KCldhcm5pbmcgbGV2
ZWwgMyB3YXMgdXNlZDogLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD0zCgpUaGlzIHBhdGNoIGlzIHBh
cnQgb2YgdGhlIG9uZ29pbmcgZWZmb3J0cyB0byBlbmFibGUKLVdpbXBsaWNpdC1mYWxsdGhyb3Vn
aC4KClNpZ25lZC1vZmYtYnk6IEd1c3Rhdm8gQS4gUi4gU2lsdmEgPGd1c3Rhdm9AZW1iZWRkZWRv
ci5jb20+Ci0tLQogZHJpdmVycy9pM2MvbWFzdGVyL2R3LWkzYy1tYXN0ZXIuYyB8IDEgKwogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFz
dGVyL2R3LWkzYy1tYXN0ZXIuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmMK
aW5kZXggYmIwMzA3OWZiYWRlLi41OTI3OTIyNGUwN2YgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaTNj
L21hc3Rlci9kdy1pM2MtbWFzdGVyLmMKKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL2R3LWkzYy1t
YXN0ZXIuYwpAQCAtNjAyLDYgKzYwMiw3IEBAIHN0YXRpYyBpbnQgZHdfaTNjX21hc3Rlcl9idXNf
aW5pdChzdHJ1Y3QgaTNjX21hc3Rlcl9jb250cm9sbGVyICptKQogCQlyZXQgPSBkd19pMmNfY2xr
X2NmZyhtYXN0ZXIpOwogCQlpZiAocmV0KQogCQkJcmV0dXJuIHJldDsKKwkJLyogZmFsbCB0aHJv
dWdoICovCiAJY2FzZSBJM0NfQlVTX01PREVfUFVSRToKIAkJcmV0ID0gZHdfaTNjX2Nsa19jZmco
bWFzdGVyKTsKIAkJaWYgKHJldCkKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1pM2MK
