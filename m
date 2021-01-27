Return-Path: <SRS0=Xn1S=HD=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D5ABC433E0
	for <linux-i3c@archiver.kernel.org>; Mon,  1 Feb 2021 09:31:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 269C264EA3
	for <linux-i3c@archiver.kernel.org>; Mon,  1 Feb 2021 09:31:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 269C264EA3
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1pIsyYkKbhTs1AkFp4CicqOwXvLFv61aVxVIYKJ24nc=; b=LGEDbdMRv6Q5/VxGvkfFLLXErz
	gkm3mf4s+96COC4hUULcBkCFUBDtLh0W16TsNo+UvIOfQT8UE/6ByG6DmzpH9XVuTz58vViD17Ugx
	ibR7UuxuUU2NgjRVPrh3X9/XIa+8vQY2iDSc+U3J50LgKHHYJ6mmDv8GurpKH17fCDrgKCg4a8D67
	fmIP3qBHZzz3mbhcDOQE4JsErILwXPpOSd0pAiTbBreqhC4pnSux7KfjT2vZW824IXLFLvHVMTryD
	gdbR73qDHzWuqKdM1gSRxxdIDs3fDW+1iiaD/NCXLgCQBNAjoQOjm7w6Hb34il5j3R1NNGKkqPmGG
	W7rLO1rg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6VY8-0007OO-07; Mon, 01 Feb 2021 09:31:12 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4c8l-0000Re-Pe
 for linux-i3c@lists.infradead.org; Wed, 27 Jan 2021 04:09:12 +0000
Received: by mail-yb1-xb49.google.com with SMTP id i82so1030793yba.18
 for <linux-i3c@lists.infradead.org>; Tue, 26 Jan 2021 20:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=/NFozpI8ZbWwzRiGUBVcpbxoLur7ok4y0yyNaLYcumw=;
 b=Li+8q1/gaF5amm8CoyhzDjvW/Pl5jRGy8lpG5kJ0u6HESxuskQOSzgOi+sbdB4GwIA
 fqSyll1awe+3ZNfon1cXinDQNWFygpzRq6QmChIy4kkaUwvIXGqYhFKo//wiPe+oNBA9
 49em6YWQK2v0Bb7pZCfPzP6ZNyq5N/x+1ncL7GLYOR9MZpUsUazfvaIZxfGKC8IpTx4F
 TGjNQqyRVWO9gv5q2v44opfbfNy6dbhfpi6+AWuxeRJTZMB5dxHsJRpGj5TKU96+ffeT
 3/haVcouLdC4VU0seOF4gVXFZrz1sSjFXSSjgvEKy41x3Em1peIVKXE1fpJkpesW0Gp3
 lLAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=/NFozpI8ZbWwzRiGUBVcpbxoLur7ok4y0yyNaLYcumw=;
 b=ORsG9CHSrSTIqyPcgfBJ1excegJTP8tcRc3/NLeSRPfuGJxFas+WSH965FJOr8DIZ7
 2365gx9gcoZN/zC/1KwTT23XeEptCArIWuCLn+07l3uYFXJWLoXHf2qZBKbLzr4xCSaa
 aTKZrqnunooJJpFGSlav9G85D63AjcI+JFLkYmxYebeiNn8FgONeda/LYivai6YepE1F
 odzRnikaU2Ru2I2gpSC98P1YFSmG4C7HPrSqTAU1NxVLdrHU0E4RHUNGkZybRvcvV7NV
 Tw5H1W1ZKG0r55WOnG1TiHFGJV3jP1XCUvLtUbzLJIkklxPy00Vx1SH4E1UIPQLbgqvO
 xM3A==
X-Gm-Message-State: AOAM530P7rh/hPe6NglX4/jEJBJWQ2Vga7vDFSP1rNn/EUhyg9upu0uH
 6FKeu3cS0/zjVTm69t/1t+Pl5xTpxwPWQA==
X-Google-Smtp-Source: ABdhPJyrgWDt/A/kkQL9NBTPoU3UjkmaFq1Tbo0yECsvcrcuafexRiuwO9ZJfstVallP4bGH8Ka7E2FzQoqlNQ==
X-Received: from spirogrip.svl.corp.google.com
 ([2620:15c:2cb:201:7000:2f04:a262:7158])
 (user=davidgow job=sendgmr) by 2002:a25:6ed7:: with SMTP id
 j206mr12923711ybc.312.1611720542946; Tue, 26 Jan 2021 20:09:02 -0800 (PST)
Date: Tue, 26 Jan 2021 20:06:37 -0800
Message-Id: <20210127040636.1535722-1-davidgow@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
Subject: [PATCH] i3c/master/mipi-i3c-hci: Specify HAS_IOMEM dependency
From: David Gow <davidgow@google.com>
To: Nicolas Pitre <npitre@baylibre.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_230911_873513_2F8C49C0 
X-CRM114-Status: GOOD (  11.77  )
X-Mailman-Approved-At: Mon, 01 Feb 2021 04:31:10 -0500
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Gow <davidgow@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

The MIPI i3c HCI driver makes use of IOMEM functions like
devm_platform_ioremap_resource(), which are only available if
CONFIG_HAS_IOMEM is defined.

This causes the driver to be enabled under make ARCH=um allyesconfig,
even though it won't build.

By adding a dependency on HAS_IOMEM, the driver will not be enabled on
architectures which don't support it.

Fixes: 9ad9a52cce28 ("i3c/master: introduce the mipi-i3c-hci driver")
Signed-off-by: David Gow <davidgow@google.com>
---
 drivers/i3c/master/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i3c/master/Kconfig b/drivers/i3c/master/Kconfig
index e68f15f4b4d0..afff0e2320f7 100644
--- a/drivers/i3c/master/Kconfig
+++ b/drivers/i3c/master/Kconfig
@@ -25,6 +25,7 @@ config DW_I3C_MASTER
 config MIPI_I3C_HCI
 	tristate "MIPI I3C Host Controller Interface driver (EXPERIMENTAL)"
 	depends on I3C
+	depends on HAS_IOMEM
 	help
 	  Support for hardware following the MIPI Aliance's I3C Host Controller
 	  Interface specification.
-- 
2.30.0.280.ga3ce27912f-goog


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
