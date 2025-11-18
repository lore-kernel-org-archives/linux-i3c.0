Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37586CEE33A
	for <linux-i3c@archiver.kernel.org>; Tue, 18 Nov 2025 16:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ho76j9yTV+lZuw74z4zNu1yllRQYVqbdTs1THdyKSUY=; b=pgJ4bMX2JAN4X6
	yOZVlzxzDqmj+ryyh2Btu9zIsXTE5a2rZl8uqvxJzZaSCFTgykv3+oRYhrZe5DAwYyQ1VlTxo7awJ
	VZKX/1IZMXpqe8+f3ahyAzq9K8qMp2x+vxT827FkdShQZijN+EIf4lt0dfCyaDvxq2KFpzFuwKqAA
	rQ6GFL70/0FcaWAETfM8Cf1EMO2SvStVR/OlSve3gfHm3ZqapoBar81DmOQwWFRCeZBcDgO7heYT2
	sywc5bHbxvU9IN82zaYZikdoMyACEBgxVtk/3Byiv69vkN6isp48ypdPxQMmjFgYb+PE+lQ20OaBY
	n+CTPYRv11O7Ip+hq7rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOpP-00000000lth-43rb;
	Tue, 18 Nov 2025 16:45:15 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOpN-00000000lsT-0vcD
	for linux-i3c@lists.infradead.org;
	Tue, 18 Nov 2025 16:45:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763484313; x=1795020313;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gKXER3n4StH8ePMLEmiZFBTK7h4o1YxrLo8YmOfRXWc=;
  b=ZFpJn1mGkZ2lWsG8YAn8FbVHctExBH1nDAr+WxttoYNL4RsuPDRzkzP9
   tR7J3WTRQQleYAbaInSbieHamS7pTS9MO2/5N4arfq7r9HkW+SY92Cnue
   17CS8QaqYadsPH6Oq0zGnxbBPWVAQL/mkwYMxov7SifGTeqf6ZB30S0c/
   XxASmXE2375su9IQ2rZbV/E3Kh0TXO5l6t219r91sJHuMFJpJOyRvT1qp
   hf6PvICz/3uVkerrdOFZsB9HywhDSTgYn/2SUrjoOk35WVlBW7qk5tiN3
   IR6d47fKSZK5o7cSUyZSrzwJEB8m6Qsr+6ualau+sZuTqI8+U+xOFq3Wp
   Q==;
X-CSE-ConnectionGUID: rK/WNNtHR+KNy/zpwjaMYg==
X-CSE-MsgGUID: YIu4DOShTvuQgDyzXlye9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="64510678"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="64510678"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 08:45:13 -0800
X-CSE-ConnectionGUID: U2ReoEv6Rpq9zdkYjWhH6Q==
X-CSE-MsgGUID: ElDKiuwuSgCt08niz/cL/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="221462904"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.65])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 08:45:11 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V4 02/12] i3c: mipi-i3c-hci-pci: Move all Intel-related definitions together
Date: Tue, 18 Nov 2025 18:44:43 +0200
Message-ID: <20251118164453.55532-3-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251118164453.55532-1-adrian.hunter@intel.com>
References: <20251118164453.55532-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_084513_290661_CE9900EB 
X-CRM114-Status: UNSURE (   8.39  )
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

Move all Intel-related definitions together, to tidy the code slightly.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V4:

	Add Frank's Rev'd-by

Changes in V2 and V3:

	None


 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index 3cd15ca7d391..3d854cee05df 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -17,14 +17,14 @@ struct mipi_i3c_hci_pci_info {
 	int (*init)(struct pci_dev *pci);
 };
 
+static DEFINE_IDA(mipi_i3c_hci_pci_ida);
+
 #define INTEL_PRIV_OFFSET		0x2b0
 #define INTEL_PRIV_SIZE			0x28
 #define INTEL_PRIV_RESETS		0x04
 #define INTEL_PRIV_RESETS_RESET		BIT(0)
 #define INTEL_PRIV_RESETS_RESET_DONE	BIT(1)
 
-static DEFINE_IDA(mipi_i3c_hci_pci_ida);
-
 static int mipi_i3c_hci_pci_intel_init(struct pci_dev *pci)
 {
 	unsigned long timeout;
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
