Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDA8C5CFC1
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Aug 2026 08:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gT5Rqo26NXQUqP+bnsCaN05Qc2q4ReGqBIY3Efnb2NY=; b=4Ndg5KUwfacPQm
	zcJUW64XN+ZfZRWHoGR1n2lJudmV/K6kYg7CJ2oHsqzMa3/opueHlGV8ALVfXHvINXAybT332c9N1
	qrFqyK88+Y4egsyfxliCphFpQYF/JZ719pn4AvtPisOHYj63hbQT6uyyYvOvj6xVYBWANKugeHcIE
	U6L2HqH5XQ8iPmxIWA7vAEDX31SqbwNJa5Px+0/gWb3xjxT0yrq935ohHArcVwZkqkMzYvY0mLDZ3
	st9ictKX6vBLYa6ODMIL6W5U5B6hl4RE68ktJv9haRQMYLXwgVActqRE3nufNDi9NEqd7JPQZvYqo
	X5YsIAboTr2zKqjvRFtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsga-00000005gmY-1GmB;
	Mon, 17 Aug 2026 08:27:12 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsgY-00000005glV-0J43
	for linux-i3c@lists.infradead.org;
	Mon, 17 Aug 2026 08:27:11 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso2966268a91.3
        for <linux-i3c@lists.infradead.org>; Mon, 17 Aug 2026 01:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786955229; x=1787560029; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z1cwflAs7P4yZoyXcCMRTeUn0nzDRsqCYYs1vCykTQY=;
        b=MqTtWDwETRoREWgkkK7EEmL8zVnjfw7dW8YvgLBnJEiYy1u5Yh3rbYDCiLrLscr7yA
         xGK3EgbrmwV9ivOhe/XDSDcnbmGOcGWKjVIni/vrKsETeD54PmNdDNh3an5KZg21xzCB
         tmYfOSeupJvr5Lty8dHHRue0nc6Np65Su+U58kJOiix4TcdBiLjsnrJSuCPkTHNbmI+k
         thc3yrr+4mlF2o63YWold8AN/oDqZY4t71bOIQ2izwRiEcWQTe8w0tLrWt9fHGC1JTVk
         ORmomD+4NulKNfKSBPtPaqc2jtD20CuDHGf9kjoNsyi6Vjb96v33g60NKE037jyNtDwp
         BICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786955229; x=1787560029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z1cwflAs7P4yZoyXcCMRTeUn0nzDRsqCYYs1vCykTQY=;
        b=AZ6CHgYY0oWAx4SXy/ggymO7Dnl80n7AR808ui98uyc9vqhGxt/xfxlckgLZ6r4RxQ
         Mbb0cS4U0O1RmLQqGQCymUeoQmSFwO3J6wilT02PVwQ2HNbXj0TVVoG+vks+Ris9uGW0
         a+vcGAjZXZUgg6KuXI9htWs0gF3EzcDDlfIXDH0oinBkmISau2FZ/0GaujQ1kYXGGow1
         /KkBAcehnwz+7bnI3866QwItoaqL+xUY4OQrJxlXGUaxIuGG9l7L2W44nBfhXObMTXSK
         Nb08YFHWBZL1PHiq9cbz3N+f7+mtGpLaKRIp7M+t4XvOgbUaTg8FRP2IbYvPpSS/M5NZ
         yOKw==
X-Forwarded-Encrypted: i=1; AHgh+RrNcGVQNb9LoJytNTSo57Pjsf0tI2DpPkizVrG1LLeD2cS+oA3VBReLHfJqdMv1cCjDWJKmeBPQpQQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0WjZ45DE61d8sRHVv70OKuGS75CFjoMES19aHOfrqHSHWA6d4
	NCw3VY2ajJNRBYK1vVfok6wgyAkLxK7rssG2aHLXonDk+jjvm+zI49+fvv4bIg==
X-Gm-Gg: AR+sD12Xe8Qs2/2sInuNws5t28WK1Mde1H2tXWoT7AB6Q04Oqs3TOQIi+zTw32OAADx
	uYwpcKvKei8jnXLbB+P8Lgr3xghXpp5FbPHbxoS9q9yHKyeGtJD0tgnkcyESEIbkwhn/5MJ31P1
	FwnIL9Jb2uV77yMBnEtezx3iilwe1fhHGPxhzoU7xW6B1zAe7Gd4ePs+Tc3H07Y8xI7I19+Mz4l
	18zp5GJ/XE4HrThxl71/zRVCxfhLyRw4GsQ4rhyUh5uEenxkX23NUb+buzFKvkNPcgYCeq7pDGB
	Ivc7SkGJvELk0SlfEeMi7ncrbE++E5ENsuW3HVi+EAbBEBqV3Ahr4Rh3K4XQKeW8nc5rReZIiYS
	0Pak2CkDFvJzhIAsuPAskvafOPQSRjDvLpF0VYNND2n69E0VT/rsH6GjQgF+ApT2u8nU5wnnfkZ
	J2dWLOW6uzoGWtUkWAekd6XrX6SdOGXGL8Kq5OsMobub5pSrXcXHM4KcDaspVQxpKroka/N7KJx
	B5FDxyAfYDNRND3+037dxzc+mj3clHyr/9h7jafdo39fOHN0VY92ZLnCRVkKeOQQ9+rqpOCGv6v
	PnvHMeFTWQ/XzBLzgQ==
X-Received: by 2002:a17:90b:38d2:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-3933b807a97mr22186374a91.6.1786955228510;
        Mon, 17 Aug 2026 01:27:08 -0700 (PDT)
Received: from jm-Lunar-Lake-Client-Platform.. (2001-b400-e15c-4d9e-e270-183b-5fe6-6f07.emome-ip6.hinet.net. [2001:b400:e15c:4d9e:e270:183b:5fe6:6f07])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d2b8080sm1393379a91.4.2026.08.17.01.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 01:27:08 -0700 (PDT)
From: Jian-Ming Liao <tim678910@gmail.com>
X-Google-Original-From: Jian-Ming Liao <Jm_Liao@asmedia.com.tw>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	adrian.hunter@intel.com,
	jarkko.nikula@linux.intel.com,
	boris.brezillon@collabora.com,
	linux-i3c@lists.infradead.org,
	Jm_Liao@asmedia.com.tw,
	Patrick_Yen@asmedia.com.tw,
	Chloe_Chen@asmedia.com.tw,
	Yd_Tseng@asmedia.com.tw
Subject: [PATCH v3 0/3] i3c: mipi-i3c-hci: Add support for AMD_PT and PIO fixes
Date: Mon, 17 Aug 2026 16:26:44 +0800
Message-ID: <20260817082647.612471-1-Jm_Liao@asmedia.com.tw>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_012710_121583_559BBA8C 
X-CRM114-Status: GOOD (  10.90  )
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

This patch series introduces support for the AMD_PT I3C controller and
includes several improvements to the MIPI I3C HCI driver to enhance
stability and compliance with the latest specifications.

Summary of changes:
- Patch 1: Fix missing STAT_IBI_STATUS_THLD in PIO mode by enabling
  IBI threshold interrupts alongside error interrupts.
- Patch 2: Add explicit PIO queue management (enablement, starting,
  and stop/restart logic) for compliance with HCI v1.2.
- Patch 3: Add device ID and platform support for the AMD_PT I3C
  controller.

Changes in v3:
- Addressed review feedback from Adrian Hunter:
  - Patch 1: Added Fixes tag; updated commit message and code
    comment to reflect missing STAT_IBI_STATUS_THLD and interrupt
    activation on first transfer; aligned From: and Signed-off-by:.
  - Patch 2: Aligned From: and Signed-off-by: email addresses.
  - Patch 3: Restored Frank's Reviewed-by tag from v1; formatted
    platform_device_id entry with '{' on a separate line; moved
    amd_pt_info to match device table order; added space before
    closing brace in PCI device table; aligned email addresses.

Changes in v2:
- Patch 1: Removed unverified "Hot-Join" wording from comments and
  commit message.
- Patch 2: Addressed review feedback from Frank Li:
  - Removed '-' prefixes from commit message.
  - Reverted unnecessary debug line movements and cleaned up 
    macro alignments.
  - Removed redundant manual kfree(pio) to prevent double-free issues.
  - Adopted a helper macro for HCI version checks instead of hardcoding.
- Patch 3: No changes (rebased).

Testing:
These changes have been validated on the Intel Panther Lake (PTL) and
AMD_PT platforms. No regressions were observed for existing
controllers.

Jian-Ming Liao (3):
  i3c: mipi-i3c-hci: Fix missing STAT_IBI_STATUS_THLD in PIO mode
  i3c: mipi-i3c-hci: Add PIO queue management support for HCI v1.2
  i3c: mipi-i3c-hci: Add support for AMD_PT I3C controller

 drivers/i3c/master/mipi-i3c-hci/core.c        |  5 ++
 drivers/i3c/master/mipi-i3c-hci/hci.h         |  5 ++
 .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    |  9 +++
 drivers/i3c/master/mipi-i3c-hci/pio.c         | 74 +++++++++++++++++--
 4 files changed, 87 insertions(+), 6 deletions(-)

-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
