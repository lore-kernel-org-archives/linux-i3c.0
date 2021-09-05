Return-Path: <SRS0=bmv/=N5=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31B00C433F5
	for <linux-i3c@archiver.kernel.org>; Tue,  7 Sep 2021 18:48:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECDE9610E8
	for <linux-i3c@archiver.kernel.org>; Tue,  7 Sep 2021 18:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ECDE9610E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hq5dnwrICl2J6L4vg4dJeeyBF6bU7CEwB3RhHIAcJJY=; b=zCu8cDOadmzi1n
	exkp6Sf29tsWdDoNAY4G4y/QWci19OLzXwDHywoAbb9Ep1szlEmv+YKBB4sO3zx5ZzdLvBIw8cb0A
	pHLxnElMCjQH1btt7mJ2nMtrCKQ4YhSaLL6CA5JvJQhjFuX8/710fpc+wnBkDLoehKyqOXaPrPzfq
	6/2vDGKZNiSkN+eX+KnZKa9I4GL8f0qUUg5JMxGsP6x6naOkyVIj9bmRQ/1En5NOrHDqIlt7HB5yW
	wya9kS9sOkc3+KUUMGNHi7fvoPiZaWrDwqDlTnbqkXIOxQJHuuO+VtKSlIIS+J/74Y1L3qjXpIgF5
	rfNxAadYMIL1DgBK1OEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNg9J-004TT4-98; Tue, 07 Sep 2021 18:48:49 +0000
Received: from mout.gmx.net ([212.227.17.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mMtKn-00FyXh-Pj
 for linux-i3c@lists.infradead.org; Sun, 05 Sep 2021 14:41:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1630852879;
 bh=/yNWBRvqjRvVJvu5VKkCkojXul/mjGRN/XfiECWSJkM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=I7++3TSRXjsTIoUO0U+ZzEorASnxONpYE0w7wjyv8St9DR0Dpgenh3Lz4sKgYrDkF
 QXOJ2bhZ3Zlmuln1CFrDnwKlwqXNnA43RRjP9frPBn4cSl8d5QABO0F0Vc/ew5ZiVm
 QpFmC2lH/i7zaS7Ya7sWB4UuHkJaFlhj+eoxUWe8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([79.150.72.99]) by mail.gmx.net
 (mrgmx104 [212.227.17.174]) with ESMTPSA (Nemesis) id
 1N79u8-1n1PAx1eMG-017V9e; Sun, 05 Sep 2021 16:41:19 +0200
From: Len Baker <len.baker@gmx.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Nicolas Pitre <npitre@baylibre.com>
Cc: Len Baker <len.baker@gmx.com>, Kees Cook <keescook@chromium.org>,
 linux-i3c@lists.infradead.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] i3c/master/mipi-i3c-hci: Prefer struct_size over open coded
 arithmetic
Date: Sun,  5 Sep 2021 16:40:54 +0200
Message-Id: <20210905144054.5124-1-len.baker@gmx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:Yc2GaUmluNaGyeUBD5O7eBSPVcxb2yxz/cdqXlCbWGPG4AzBvIx
 swPL75n8TCf1Dh4Mq7gXJOusgv/FFSN+3EHxwyRKa/mKG8lIb0zIjLAlXTl7Sg7A8rY/sF1
 Tiycvr8QMT51Y4Oi2f9ba8iEwhXcTholcGrPp1e0NzzU+SH3ik/uWYWdJMRQ1c+6E9enyYE
 TQ3HcftPZ06G6rFOLgoAQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zYDDzlJ3NSw=:GnvIasji+IGndezvkoibuS
 4ZravIVL7n+M5ACFaaA5OCTuhuXNa/uOvA2IIRONr/29qzrwjZkaEmanGZ0piUuCiVShq3Pcj
 ryVsYGurW6Sw0hv6ze1K26F0vl3J6P8ZFRg9tNYJIn2x9bucitUm3aonIN2y915kKnfyzcntx
 c1O8+TjUC+7ZEGitpZkdWUvFUDpF54ID7fhFntoNDp5UkOwmLJhDVec7fSl3k9+i2LP9d+sIM
 k7q3Q66cWSV9SB64aQyCoCkKiXz2RJFlvxZ3fxJawbMrs+UMqJmQDRWlH2orb5n648YFFFxNP
 Ct1S5KaY88iGMQK1OfFM6gxIH+5pCw+AIq+zWl3WUkNFRWa1nUdAZA/+gvHc0NW5eyabMydCe
 xYvRX13+i1wEUtrHBuXgBjLKdXMdthzr3ohTzqr/xyC0Ww2N6mCH3SZaB0IEQZlnTLDm0LwD8
 /74yJLyh6PCAaTQsQ/X7qwbfPB9NNaz68F2oUnT6jkTFUrbO40Eg60QeG8RhtT96jm4PcdJky
 gPI4EQDYbGuZwUGENF8gp/uQaBZhUejhbrjiW7TRq81plTD3jG2xK2YoeBKT8+VYI1MFxzdEx
 zz5tVlACh7Ia6VFCB53wV2jAY/DwEB3P2Ks5nIwtG/ASGu4sIxuwZJ9TvmNCkucOAgcHtxjSv
 fh4J2lKxLDTO3VmreCP+R1DqfH7NjV95yRHFavmeqBGHWgW3J7PFylGti4JgVT0Y3JJJJ23GH
 auo9uc/dIl6Fqsd+afZrBk5uVhMnEzRewelyCQQ77IWcjPmOIPZkS7AvYA2D65lOQeNv4hWhs
 YNizgGcOQw7e+NhLF5XwhnaoMAUzLoYmxK9IAM04gCnHZtmDu8YbFp7kUX8oeFQERvPKhdUb9
 DnwOjrs0hmpmPRvu95rG07cWkiLEx/h52ouftJ0r7c4K6hciAhT5GkBL35TIwiNEfz8CX1qIf
 rdd6/HpPBtY/pq4GKEJTMJ2Grh0oRvjy0Z8m6iG7JTe/Go2V/uL+qLnNGS7FDLdxbj8ztmM2D
 yEVFEb9A7wHJ5VO6FRlbaFuJp7YEbegrhj4C7TzJa9vfFTat6CI8RKLKfSRw7JYYerxUSnfEl
 He02EeJDVlzNrrXVmOGDv4z2DwD5qwiKeEMF29NzZhxlSKGjJQe8vcXRw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210905_074126_173579_3EACD090 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Tue, 07 Sep 2021 11:48:47 -0700
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

So, use the struct_size() helper to do the arithmetic instead of the
argument "size + count * size" in the kzalloc() function.

[1] https://www.kernel.org/doc/html/v5.14/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments

Signed-off-by: Len Baker <len.baker@gmx.com>
---
 drivers/i3c/master/mipi-i3c-hci/dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index af873a9be050..2990ac9eaade 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -223,7 +223,7 @@ static int hci_dma_init(struct i3c_hci *hci)
 	}
 	if (nr_rings > XFER_RINGS)
 		nr_rings = XFER_RINGS;
-	rings = kzalloc(sizeof(*rings) + nr_rings * sizeof(*rh), GFP_KERNEL);
+	rings = kzalloc(struct_size(rings, headers, nr_rings), GFP_KERNEL);
 	if (!rings)
 		return -ENOMEM;
 	hci->io_data = rings;
--
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
