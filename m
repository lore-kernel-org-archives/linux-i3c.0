Return-Path: <SRS0=xdse=OC=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAFC2C433EF
	for <linux-i3c@archiver.kernel.org>; Sun, 12 Sep 2021 16:46:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B95961076
	for <linux-i3c@archiver.kernel.org>; Sun, 12 Sep 2021 16:46:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B95961076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jD6Ak12Tsjz9Hyh9gdpgdY+c+PuRpAumV7/UEuyz6KY=; b=w1+qZcNqH3DBOo
	Fo6ho3QyNjeZYYoIwNjU3OHAXblEJfyDgy708OxzNnTmiUgzN0Pn4yVq2KOe3VpOy9/t3+469OAOE
	sH0YQT/69rayFFBST+CE/YVXTITyI6Fs7z5j2vt7jYWyjPA0CnZWeZOWMwohaWI1jLu/5t8PXZqb4
	MBSkA5h5T8pw9Osbr8BwRcmTrnDo+5pVgH4DefeB/pAeb6PvHikV2UZ57on3HQogswDmqoeqfzYOi
	GCKnH6OGwBcp17Gbr3BJoP3Hmf0B5BdE4Mj/ik+wp54uE6FVv5v5cEXF4ULO461DlNu2VxPV3d1Ih
	jfJOxHFJvM/MpYpXvshA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPScC-00Gk61-F0; Sun, 12 Sep 2021 16:46:00 +0000
Received: from mout.gmx.net ([212.227.15.19])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPRly-00GeYG-2Z
 for linux-i3c@lists.infradead.org; Sun, 12 Sep 2021 15:52:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1631461914;
 bh=acR4bOYsVFW3jWp5YfwQ2ux3deK09WbrFwToGIM5Wr8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=betXKHWy88VQXJn/oCsS/DwSPiMD2g+7M5yrfDJEOq+jhucC93vV/XtyDal2sGlka
 xmLZAd1qc95FgGQo/fD6Hexyc1U0eU4F3MOswwlnsRtaIPKVoWwsU/TU3kZU34Ixy1
 o6q6OUlCeDsHz+PFAxZURE+H4JLobEx+KCy+QK/4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([79.150.72.99]) by mail.gmx.net
 (mrgmx004 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1N9MpS-1n28f01Ru0-015L0K; Sun, 12 Sep 2021 17:51:54 +0200
From: Len Baker <len.baker@gmx.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Len Baker <len.baker@gmx.com>, Nicolas Pitre <npitre@baylibre.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Kees Cook <keescook@chromium.org>, linux-i3c@lists.infradead.org,
 linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i3c/master/mipi-i3c-hci: Prefer kcalloc over open coded
 arithmetic
Date: Sun, 12 Sep 2021 17:51:35 +0200
Message-Id: <20210912155135.7541-1-len.baker@gmx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:12Wxb35A9HfIn30GEUc5xzIzDRpJ5lPs/PpFMm+D3nx+SYskX9X
 5yUBASZXWNG9x2DIsftzvtH+mycCDGn0lBzzRKz56ZNK8N83gYraXbaelZVYvj1qHGY4PRp
 Bw5Z+ZJYd7WwV06KAuwduDbMYi+PUGmfCriF+/o+ZuERBS9ByFgl0T0wpNjoAKjQtVQRLsX
 NQGzDGcZrJZxytOJU6ONA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Oa08IYzxaO8=:LdljQr4FvbYrpeql8L/94t
 zY6HFuPCFEUy2ku3dg6IYlfkM0GscR+L/nMs/9++kjR4mt7x5j60SP+LYaND79n/H/z65T1nJ
 Z8ryXDxs+dUVEXmY2dg0h3oWplA9p5t5TjlsaVefcbZmBz0zJgFff6L8mzPgDzOSAUufA5MiI
 ywrRDHL8wx4RF0xfm1MF6vpGoV0QUlQH4qakL/tvd511L3E1hovSS4+rJFAKy/KSP/IVIgSM/
 VHSWz+Nn7/BbBXFvHpReklkCtOw7R/BAYHdruVZ2/npUuVUgugu67nX6gogVqEF76Oq8pIIH9
 M4XLPoZFaY3Lbxu6KmtP9SMuMpJpbnDo7AOmytJW0X3NspfAgWPAY92IccplqemHE6tXOwGAo
 IofD6tMF5fTyIr7nqeRSmn+dmRqwth0ZLQtoH3bccwk1J+Q5A6nNz/p7J8HdYK+wz7IQ+ek91
 i9ExzqqQh2/IKqogfAcnh95n6iA5s3PYNjWXMNuju/Gv9Ku0Ip4Y7+qNSoakbPCnQVb2wo7fe
 4dKO5wLEBXZ1gnUwlaO9sisOQ206/MsEavQnzfT7GnTy9sZh7dlpsckaHoVvGdnNOOllOHy4y
 P7SPrfA+3Z0SG8DBnoG0bIa/kO9JGWyPpW8QmVb1EbqrDBnxC7SmH5ubF3cmbf0NriN11mMY3
 IHb5Bx5e2Z6iUvKRcFMxKYSdiIM3rRuzioBhueDDDh2OE1fBQ/EciKt4vDD76YhO4KNmFDIPf
 7qlnIZ4OVp6nK++R40P/mDcz2IsvaWih/ANNL8/qU2GO76j6UFRW719Gjzk7pbFSGTlgKP6lY
 HuRGsngGLpUxzKI8cna/stS1NvGKb6Ko0vrHgtalguhIKayqqMlcAF60EtFtLe1Sd4cXAic0p
 zDzxV4XnAyTqU4ShuSG0NYXgnJP3A/qy4VWWYro1qTvy7/Cygm/a/w2qLH11OljwIkyovBgK7
 9RY5/MP0sW2bfJNlT/nNzNlM/UYWZexuXq1aCxL4iljcsCNQYf0DEWbZ5q5evnUw+Jj8KjIPJ
 HHLn4sDWhIAVH7HVb1tacK0NgwL+2vcujrfjzh/tIaCYlErsWrBp/JxZAYakjJONdxWYM0psl
 j9QFX9ZDLnT36w=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210912_085202_452618_953CE806 
X-CRM114-Status: GOOD (  10.60  )
X-Mailman-Approved-At: Sun, 12 Sep 2021 09:45:59 -0700
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

As noted in the "Deprecated Interfaces, Language Features, Attributes,
and Conventions" documentation [1], size calculations (especially
multiplication) should not be performed in memory allocator (or similar)
function arguments due to the risk of them overflowing. This could lead
to values wrapping around and a smaller allocation being made than the
caller was expecting. Using those allocations could lead to linear
overflows of heap memory and other misbehaviors.

So, use the purpose specific kcalloc() function instead of the argument
size * count in the kzalloc() function.

[1] https://www.kernel.org/doc/html/v5.14/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments

Signed-off-by: Len Baker <len.baker@gmx.com>
---
 drivers/i3c/master/mipi-i3c-hci/hci.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index 80beb1d5be8f..f109923f6c3f 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -98,7 +98,7 @@ struct hci_xfer {

 static inline struct hci_xfer *hci_alloc_xfer(unsigned int n)
 {
-	return kzalloc(sizeof(struct hci_xfer) * n, GFP_KERNEL);
+	return kcalloc(n, sizeof(struct hci_xfer), GFP_KERNEL);
 }

 static inline void hci_free_xfer(struct hci_xfer *xfer, unsigned int n)
--
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
