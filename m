Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2896C28B30
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Mar 2025 11:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+Y0Gnf9EFQOI8vM6HhoPUUVvzaDzfxCEhJ5ezI3ScN4=; b=2Kiv/aXgHNOGXB
	7yb7WUKp/FZcxsbRgy/NKXOeK4k8phQVeApQzZA7knaz3/ZpTvMJjWrZ7A8LgDT7FGRWsxnJ8qib6
	Fqc9HKsOXA8Lu6bm1tU9f6nbFU1zmxWRZVKoiML5dSbrAuUhpCx/BRz3ddvjn46S3tLiENAWm6qHK
	l9Vf21y+u/xHRdqNfL4ohzmPXmuEYE5l34fUNN7wJA3t3kP2T6JnkfkFSkKhzcR/ZGkdCdH1sECJb
	b3O1WPuyQbgwq9Loyxlabsw6bGA4z16kKfFOSldtNvKYQcJPB8xI61soLNrv0X8m2TxU17n1GvBHt
	SWlsIHT5x/RQl6Mn0CGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsK7q-00000008Edx-1z3Y;
	Wed, 12 Mar 2025 11:19:50 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJzE-00000008DVP-2McD
	for linux-i3c@lists.infradead.org;
	Wed, 12 Mar 2025 11:10:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741777857; x=1773313857;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hq4UXwMOBm5dvNq+5c02cZiujjwWWd9RjymHfQFT4sE=;
  b=afkfrzoiMg2j1KmszyBfRT5rFlKS5XmGVLmqcJn/q4meGwt2Si1KGbpg
   CbfoE2xYU5Z09EXoaow/WGbXqJVAJq1oeG8aT9ycXc96GeSSigBmdouyn
   e5u/SYXOXY9Wwn65uFgBYIV11MbCD8hWnCgKZOicuLI9S4S3LkQ5xEvQZ
   E9BvD17VKv5aKYIqrrRh8WJulY3HS6SIxDH1eLl5mZtQTQ9uV4Ps1/IhV
   l/l4Kxe6f76T7Vb8RGcSVy5UGbbGGmMCVHesAFuYEBvLd+i5aIvP1raki
   oxSBp03VcQdSyv1zLu4NB4BC6iyniZUZGbjfpruGKkyIy/BW0tRFAttyP
   A==;
X-CSE-ConnectionGUID: GRrUmc0zTge71/LGiU7u6Q==
X-CSE-MsgGUID: 0WO1Jh4CRvOUTBgMSLOUHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42983451"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="42983451"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 04:10:53 -0700
X-CSE-ConnectionGUID: ojEOe4g/QOKahq8KrjeKpA==
X-CSE-MsgGUID: UpgR1se7QV6KM9R0c/LJuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="120310860"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.154])
  by orviesa009.jf.intel.com with ESMTP; 12 Mar 2025 04:10:52 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v2 1/4] i3c: mipi-i3c-hci: Allow only relevant INTR_STATUS bit updates
Date: Wed, 12 Mar 2025 13:10:46 +0200
Message-ID: <20250312111049.197855-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_041056_627728_625D6B78 
X-CRM114-Status: GOOD (  11.06  )
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

Since MIPI I3C HCI specification version v0.8 INTR_STATUS bits 9:0 are
reserved. Version v0.5 has bits 9 and 5:0 in use but not handled by the
current driver code and not needed in DMA transfers.

PIO transfers with v0.5 would require changes to both
core.c: i3c_hci_irq_handler() and pio.c: hci_pio_irq_handler() though.

For these reasons don't enable signal updates from INTR_STATUS bits 9:0.

This change gets rid of "unexpected INTR_STATUS" on old v0.5 IP version
and is a no-op for later versions starting from v0.8.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
v2: Simplified the last sentence according to Frank Li's suggestion.
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index a71226d7ca59..e139d7e4d252 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -699,9 +699,10 @@ static int i3c_hci_init(struct i3c_hci *hci)
 	if (ret)
 		return -ENXIO;
 
-	/* Disable all interrupts and allow all signal updates */
+	/* Disable all interrupts */
 	reg_write(INTR_SIGNAL_ENABLE, 0x0);
-	reg_write(INTR_STATUS_ENABLE, 0xffffffff);
+	/* Allow signal updates relevant to IP versions 0.8 and beyond */
+	reg_write(INTR_STATUS_ENABLE, GENMASK(31, 10));
 
 	/* Make sure our data ordering fits the host's */
 	regval = reg_read(HC_CONTROL);
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
