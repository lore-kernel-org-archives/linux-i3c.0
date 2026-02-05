Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63836EC1E86
	for <linux-i3c@archiver.kernel.org>; Thu,  5 Feb 2026 10:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6mZ5byprKqBy8+gz8lyqY3KEVOhrV5qQbu5vy8iL7U0=; b=STmLmXqr990yqh
	bsOGPujbAyahTmZodb0HvUS9YDARyS1KIfdOtsqw6lIX63AuiTxCM/LFPhKkhu+YhA0mT2juFjQrQ
	CfYmZvHnfXh9H28IO3C3/IDq9tJ1+JMfhRnLyVCl5FtUnz8Hz7QNdvwKNU8PsTwImnTxZGfS3yR4p
	ZVvR+fv739UNjMvSCiW1RHuG2s2ymtqwo6vYl9WQp7dMkr5ysa5U/pN5/BSxg+cdmtZo5/LNFNuVD
	FxJ6avgkTMj1tjJoreU4ZZSqejM6PN2YKC/jdD7OxEm8yoZb3pri8sawyfxIW6sYGlw8WDWwSNCep
	O2WJd3a38eQEg7EWzg3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnwIl-00000009l6S-017T;
	Thu, 05 Feb 2026 10:09:31 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnwIi-00000009l5W-1bKo
	for linux-i3c@lists.infradead.org;
	Thu, 05 Feb 2026 10:09:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770286168; x=1801822168;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rjVLBS5suny7TVIF9orh2XiBjCfmzgAyQsFZn3Fe0bQ=;
  b=inWK0mzkZyGTNCNCi9d2aMT9ZvOayjNSjhfd24vMgjQZ8f0b0AZBhaJZ
   tOrOvT+Rjm+AmcwGcNCYIcvkvmUaYBrDt2OUzTwasIBYD2vNViTVk2/Bh
   3tFuTsf8FTCALdOhUjv5CE86nhzeAtrv1dLL/88iQfbc7sw9R8R3yzSfd
   Ye9dq3cMG8zHGA8/iQ1cce7CRPF5oHi5tKjYEnSKjW37VnW4RQxKccRSH
   rxmzYwHwyNjCAhstepuDwdeHxjcqn7j21sDXPQ3hwHMWkIAkPe+vvJKmU
   z/11ep8OdXFrDKExv3P9zA3IAKIcEz372o9ozxB4OtMYfsOa5wjdfEJsc
   Q==;
X-CSE-ConnectionGUID: dtm1uKG7RlquMG3KqZ5+jw==
X-CSE-MsgGUID: JmI6Djf2QlGPf98GRqp4YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71471706"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="71471706"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 02:09:28 -0800
X-CSE-ConnectionGUID: 40eQDyFBSduOqP0Pgrzo6w==
X-CSE-MsgGUID: tPh/v2gLTSmrep5kf70AoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="214631170"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.58])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 02:09:26 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH V3 1/5] i3c: mipi-i3c-hci-pci: Set d3hot_delay to 0 for Intel controllers
Date: Thu,  5 Feb 2026 12:09:11 +0200
Message-ID: <20260205100915.19792-2-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260205100915.19792-1-adrian.hunter@intel.com>
References: <20260205100915.19792-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_020928_464786_5CA0FB66 
X-CRM114-Status: UNSURE (   6.96  )
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

Set d3hot_delay to 0 for Intel controllers because a delay is not needed.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	None

Changes in V2:

	Add Frank's Rev'd-by


 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index 0f05a15c14c7..bc83caad4197 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -164,6 +164,7 @@ static int intel_i3c_init(struct mipi_i3c_hci_pci *hci)
 	dma_set_mask_and_coherent(&hci->pci->dev, DMA_BIT_MASK(64));
 
 	hci->pci->d3cold_delay = 0;
+	hci->pci->d3hot_delay = 0;
 
 	hci->private = host;
 	host->priv = priv;
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
