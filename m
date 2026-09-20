Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 724BAC982D8
	for <linux-i3c@archiver.kernel.org>; Sun, 20 Sep 2026 15:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wgio1cZVdcbSUm5IBT5pZ7BNmTYNNalXSZ9417NReuI=; b=FuXD/7VCPb3rl5
	ilcsbNpDgjKsoEXTjL96JnQeDohe8nZpyuhho1erOx9gQJVfzGFd4OimchdNO74qB7wRMVu+xPP+n
	wglKg8zP/iOBhXe1RvMfcDK7zKx9r458oecvyC5aEJe9v9NddkliHrzQIoDQ1Q3O6KIoqEg4/BFAV
	lEiMZ+xo6Q+ZkpwnMCvhWRy8xgG4bnrhDEI8oop1vQphx4aJbNuf4dO6ng67Zlxc6TXOVFjQl17cJ
	p7Iy8e5rnsXFYdpNDfguj3e84T8pBCxEnTxRD2uuec9g/jXuH5m0Ef8xAfdV2YFMK+XDgR9juPjYn
	0BqZ/ocbgmPDwuAON3bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8JER-000000002ej-0gQk;
	Sun, 20 Sep 2026 15:13:31 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8JEN-000000002Vr-0V6M
	for linux-i3c@lists.infradead.org;
	Sun, 20 Sep 2026 15:13:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789917207; x=1821453207;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UnLFHX9DNPfckDJ6Ek7vC0R0/VfmOLxvR/O/GMUJemE=;
  b=RNhU0d0xBaVtyjFRuwN7uNpiv2NLTbDqmIkLNJHbD7UlyQ5e+HJWGQaG
   JV8NXAIbMZmKW32zs3fdP6RdG10808FH4N8Byfv6YP4DZY4eIdcu0S/2+
   0/X7PQRRpPGFyZJstfASOu4ytD1GUoANE5NFTBEIZ1NLaUQRH/lvilajK
   Sq1DXBYc7lb2hsBpAJmjCY+wobiARqOHjjG9lQv+t+ZZbH46Jrqky93CA
   73Ok7+Um1x2H+/hn1gZPPKEPurw8R/0CH0l+I/Dj8c6ZqrYpAUgCb7zA5
   wgHYZmA8C8/5y0NWvo+D8NIJQcs3V+FQfGT0iQyONEZZDImtB6Zc1FNaI
   g==;
X-CSE-ConnectionGUID: lMH3b6z3Rxy8opI134aazg==
X-CSE-MsgGUID: E+hhoge8S2CuUjDfYp9AuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="89548479"
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="89548479"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:13:26 -0700
X-CSE-ConnectionGUID: e3593JIASgOeuMA9G7MexQ==
X-CSE-MsgGUID: LXRFVtFUS16mixkEa0QyAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="3352445"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.82])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:13:25 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 13/17] i3c: mipi-i3c-hci: Remove invalid transfer size limit
Date: Sun, 20 Sep 2026 18:12:43 +0300
Message-ID: <20260920151248.46936-14-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260920151248.46936-1-adrian.hunter@intel.com>
References: <20260920151248.46936-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_081327_236739_24670E42 
X-CRM114-Status: GOOD (  10.94  )
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

The driver derives a maximum transfer size from
HC_CAP_MAX_DATA_LENGTH in HC_CAPABILITIES, but no published version of
the I3C HCI specification defines such a field.

HC_CAPABILITIES reserves Bits[31:8] in HCI v1.0 and Bits[27:22] in HCI
v1.1 and v1.2, so the bits used by HC_CAP_MAX_DATA_LENGTH are reserved
in all released HCI versions.  Neither the HCI nor the I3C TCRI
specifications define a maximum data length capability.

On compliant controllers reserved bits read as zero, making the
computed limit 65536 bytes.  Since struct i3c_xfer.len is u16,
transfers can never reach that size and the resulting -EFBIG check can
never trigger.

Remove the unused capability definition and the dead size check.

The driver's effective limit remains unchanged. HCI specifications
define DATA_LENGTH as a 16-bit field and require larger transfers to be
split across multiple Transfer Descriptors.  The driver already relies
on the core's 16-bit length types elsewhere when constructing
descriptors.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	None

Changes in V2:

	Added Frank Li's Reviewed-by tag.


 drivers/i3c/master/mipi-i3c-hci/core.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index b9b20797d045..4629a16debc9 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -51,7 +51,6 @@
 #define HC_CAP_SG_DC_EN			BIT(30)
 #define HC_CAP_SG_IBI_EN		BIT(29)
 #define HC_CAP_SG_CR_EN			BIT(28)
-#define HC_CAP_MAX_DATA_LENGTH		GENMASK(24, 22)
 #define HC_CAP_CMD_SIZE			GENMASK(21, 20)
 #define HC_CAP_DIRECT_COMMANDS_EN	BIT(18)
 #define HC_CAP_MULTI_LANE_EN		BIT(15)
@@ -473,7 +472,6 @@ static int i3c_hci_i3c_xfers(struct i3c_dev_desc *dev,
 	struct i3c_hci *hci = to_i3c_hci(m);
 	struct hci_xfer *xfer;
 	DECLARE_COMPLETION_ONSTACK(done);
-	unsigned int size_limit;
 	int i, last, ret = 0;
 
 	dev_dbg(&hci->master.dev, "nxfers = %d", nxfers);
@@ -482,13 +480,8 @@ static int i3c_hci_i3c_xfers(struct i3c_dev_desc *dev,
 	if (!xfer)
 		return -ENOMEM;
 
-	size_limit = 1U << (16 + FIELD_GET(HC_CAP_MAX_DATA_LENGTH, hci->caps));
-
 	for (i = 0; i < nxfers; i++) {
 		xfer[i].data_len = i3c_xfers[i].len;
-		ret = -EFBIG;
-		if (xfer[i].data_len >= size_limit)
-			goto out;
 		xfer[i].rnw = i3c_xfers[i].rnw;
 		if (i3c_xfers[i].rnw) {
 			xfer[i].data = i3c_xfers[i].data.in;
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
