Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2909EF4EDE
	for <linux-i3c@archiver.kernel.org>; Mon,  6 Apr 2026 12:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oVrpJNbA8JDQvZSExoue4X6lhzxOMnNjxAn9uR52kkM=; b=2R3xhzKEP4HRyf
	7hA+yjG8BJAksBdQ/ZBsLWK8Ut+UTBPoYFeBdRmX4cZofWx5IqHMVzMxHXtTuzYiy9RbcZSxh9Nhj
	9PiZwHdq5QsLyet7huJu8Bo//FvfQdCB6de40m3e+V95VdsCf83cXufSXM0A6yTtEHHMO/F25el03
	lWfTmOU7E5l5Arwwfp4rHEgX3PJEqDczlbdtEJ0o0zhTmK4Ur1j0JvzzHTIiToIlraw6uX/+qHhdr
	izzyMUynVUxixT+upQS0epffnsS28MKwoNd7QnPMkwqL39IyIsg89dzap2aqqgizsvVKcfP5y90K1
	OicEpBpCctYujcIUTTkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9jIa-000000057MS-0TP3;
	Mon, 06 Apr 2026 12:43:24 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9jIX-000000057M4-3qdM
	for linux-i3c@lists.infradead.org;
	Mon, 06 Apr 2026 12:43:23 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2b2494440f3so13472475ad.2
        for <linux-i3c@lists.infradead.org>; Mon, 06 Apr 2026 05:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775479401; x=1776084201; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/BQnaz219jqPtrPhiYSPbcWuRkUa+sPXsIfTmKKXwWM=;
        b=GtIicfg0RZJdl0BYnqDtavwLyUedNklpqFiMC8LDogPxadnb0WFSMcwD8a0gDQgPRq
         +xuiiX/8SiWjC2KYQjk5Z+5spPoKxUEFK3NGp/nNdza4+88CcDwXBPkstv/6jsmsbWIg
         F05BvqRpeyr+joIVuJaZKEZ4KKnvthC/Tk41z/3vAQ+3jjJsNfMmHFZNrNFpjY8j7QpW
         vGlbM5YuUh6DtoMq1h/bEsQGrlecCJzIDiX5X9XKRENd0+K2EtwIJcscd+mxg+UWmLqK
         H9wpxTBzRSXaYS5vbR0ox/3WByyT8M7HsQLpkrIST8lHgrD4YpSMT4abaJglMs1gVFQ7
         0dQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775479401; x=1776084201;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/BQnaz219jqPtrPhiYSPbcWuRkUa+sPXsIfTmKKXwWM=;
        b=pdT0lOLWofCXyJMCmYBnKPvhORErNwbDaMQuyDsepNG5pU0jE2EhDRnhG2VZD538rB
         ApvADSojbGsGTqnSkJx7G7JCYwEP+MVFd9jVfTMKORoner9Nlr4lc2752eGBSGsTzeZG
         2FSDd9roPahWml9UwtnHjEU9Vz8W8mcoMj+zOUObgBUTnLBG4gr/mcyll8yZk51CgKKo
         zv+sCeLTCuceO3yGmHPKX2P8uAErXg3frq8bGfiQTP1+qDFbXLDtE8co9slYrVdKH9ck
         h4VhceGYugdH5k/i8y7AGs6UJEJxGImJcl2KkC/z/d6QNYHk7JSaSjo9EuSH8oBax904
         3yRQ==
X-Gm-Message-State: AOJu0Yw7E379x6AOuhAsF0ocVew48va/fLX8G8jBnJKYq6xzckiuajbw
	y6jOsxpHL5RMIjX+iBlBL3qlGHzFnDFy3SlRUqo4lO8yzwPUM4zpWpSF
X-Gm-Gg: AeBDiesVRko1o1k97BY9szIyqn73C1GdfvRwB2ILmVLpGbdjQ32/5P/srtYaLXN1LJx
	QCOhJ0DFBaucxHBHns0bPrdQlYURupiPVmvJoaY0/NlchEpB6qFa62pLYq4oTcY6HYocJNFJh6l
	V3KWK/xIjoztXPg3zZ6dH9i3fF6yE+jTbY3cxZAAuMDz59nmUUvIEs1TQdYyvrX5aDlI4JvT2rG
	t2iQWhNKXDQXUw1sp/vT/1V7Dhr2eJMVBr8vJpEubSbNd1FwTUAZKUekhW8pmvHIZ9k7YMo+nnc
	qGBfVm3BYhyGP2BLn4w085dB8VbPdlCAASUVBfywEED6K0BlEWCFJ5Ner9TmJfnbZ8b9DpQYe+m
	ddraVjMjeXSeoz6IL1vZsmBE+6rvl7frXCbEKUbO3fQhrOvoY8uQeTFr5MBZYZ5qLlq9L7yhIkB
	duKS7V1It0ojazOn0JWz95LmnCUHFEoPGx9K/ltNwB/Xf4FwInpqa7tIqRfz5azp3MCY2oTwB5A
	USGIz/OnHnkeHiChCrH
X-Received: by 2002:a17:903:384d:b0:2ae:4555:479e with SMTP id d9443c01a7336-2b2816be43dmr144323705ad.18.1775479400596;
        Mon, 06 Apr 2026 05:43:20 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27472d233sm143486445ad.2.2026.04.06.05.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 05:43:20 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Subject: [PATCH v3 0/2] i3c: master: renesas: Fix a memory leak and use
 __free(kfree) to simplify the code
Date: Mon, 06 Apr 2026 20:43:15 +0800
Message-Id: <20260406-renesas-v3-0-4b724d7708f4@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGOq02kC/3WMQQrCMBBFr1JmbSSdatK68h7iIiaTdsA2kkhQS
 u9u2pUgLt/nvzdDosiU4FTNEClz4jAVaHYV2MFMPQl2hQElKnmQKCJNlEwSVhnvjO9uFgnK+xH
 J82srXa6FB07PEN9bONfr+tvItahFozqjXav0UeK5Hw3f9zaMsDYy/vGweF5Ta71urHb+21uW5
 QMMg+Ds1gAAAA==
X-Change-ID: 20260402-renesas-c6afdaf9bc2e
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775479398; l=837;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=2ZGhHGFfSfoGzpISONh4As0lRvW4rlzQOLfSrI7sqXY=;
 b=mjB/7ps08fqTsoB/rbBABlSzqZTfLDeMQjXR88DnidMxC94bpqddYghLJkhrqOUjkkfa0kgzQ
 V7Va5s/T+1EAgYjbd/5kmby8xPPpTcYLB5Z4X520JRnGioaNp5F0WtN
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_054321_962341_CE423997 
X-CRM114-Status: UNSURE (   8.12  )
X-CRM114-Notice: Please train this message.
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

Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Changes in v3:
- Collect the tags from Frank and Tommaso.
- Use __free(kfree) to simplify the code.
- Link to v2: https://lore.kernel.org/r/20260402-renesas-v2-1-f7e8cf73c7df@gmail.com

Changes in v2:
- Add cleanup header file to fix Frank's comment.
- Link to v1: https://lore.kernel.org/r/20260402-renesas-v1-1-369a7d867502@gmail.com

---
Felix Gu (2):
      i3c: master: renesas: Fix memory leak in renesas_i3c_i3c_xfers()
      i3c: master: renesas: Use __free(kfree) for xfer cleanup in renesas_i3c_send_ccc_cmd()

 drivers/i3c/master/renesas-i3c.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)
---
base-commit: bd0f139e5fc11182777b81cefc3893ea508544ec
change-id: 20260402-renesas-c6afdaf9bc2e

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
