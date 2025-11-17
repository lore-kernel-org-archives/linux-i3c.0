Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3954CEBF61
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Nov 2025 13:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lr8B70Fe5guRhogER5GaJ7+nGE1G7Ck9CRloVcKT2jE=; b=KMY9ygrQkEd3+g
	IgIsv8LcSQL4VrKKZNKHPdbmPjSdQ4T1VeVo3OnNxRRZGmw4Un/mV5+kIBujl+U3DiIf1/X2vTx0n
	2bjYawCnph7a5JnR+gJvJNKZQ0thdZplK7NQieG3eAzDsboasxR2U7MYDPoO32w4zEmWLMmV/xMtp
	p7p0AYxY9RpLOH96QMUJHzz7LCg2Ktb90yNhN8GB3vWMqLrHPG5c7zNf/faG0IRy3W/Igbr1zkFQq
	a98QUOCmlkYwimQDpXXuaS+jMmjcBumnXEi3ENVZwR8jiXYnZgniBQ54aXbF8rTXQPnjCtHezFHGm
	BCS50W457q4uCvkaws8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKz62-0000000GAIO-1poF;
	Mon, 17 Nov 2025 13:16:42 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKz60-0000000GA6C-2ocy
	for linux-i3c@lists.infradead.org;
	Mon, 17 Nov 2025 13:16:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763385401; x=1794921401;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8UvPiy/hdgv6le4V/ROPWA0wZL1dxIEiDwdfGX6oTnA=;
  b=EWbZZ9vz8+Rjlq1KwA1vsKR2nvoQcBB3C1xEAsN5lLI6aei4CaPSBN8h
   JdFY0vpz2p7jcsK+ffv4B0iUC7ohHXK3sh/9oyPkuc4SMYH5N3oJzQixv
   ERzLmND+jF3q4LZG0i3yNJ6P5lvdTP/hzzADcR8DNvNbpV9wUANb2bKGd
   rpET15UbgxZMCBV1s9XxpIak2ukFeL7s8Ekrj47pdmp6N+P5oPKl7x/qg
   DWxXotsqz1SAZkgwDDMUK36o+0uZ9PY5GHUW23BbfI7WwFCHZ2RwWdazg
   jT03yEqqYEppXzLpN7tAuY3KdRIwqF6jVQXfAKmiedAkKXXUPJFIwjPcn
   Q==;
X-CSE-ConnectionGUID: eijF0KF8RPiBrVwdkIevhQ==
X-CSE-MsgGUID: co0cAXKQRZeJ0E7/HOi4/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="83009105"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="83009105"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 05:16:41 -0800
X-CSE-ConnectionGUID: 27SrHcOBTpSFm5/md12tjA==
X-CSE-MsgGUID: vTLn57iHQvOyL+GYJ7wz+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="194549409"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.191])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 05:16:39 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 12/12] i3c: mipi-i3c-hci-pci: Set d3cold_delay to 0 for Intel controllers
Date: Mon, 17 Nov 2025 15:16:08 +0200
Message-ID: <20251117131609.65988-13-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117131609.65988-1-adrian.hunter@intel.com>
References: <20251117131609.65988-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_051640_718046_10C22F31 
X-CRM114-Status: UNSURE (   7.44  )
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

Set d3cold_delay to 0 for Intel controllers because a delay is not needed.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	Add Frank's Rev'd-by

Changes in V2:

	Re-based


 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index 2c827e877d29..58e00301e5db 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -183,6 +183,8 @@ static int intel_i3c_init(struct mipi_i3c_hci_pci *hci)
 
 	dma_set_mask_and_coherent(&hci->pci->dev, DMA_BIT_MASK(64));
 
+	hci->pci->d3cold_delay = 0;
+
 	hci->private = host;
 	host->priv = priv;
 
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
