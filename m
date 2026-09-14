Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBAF3C88E70
	for <linux-i3c@archiver.kernel.org>; Mon, 14 Sep 2026 11:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ALjWTJohWcMu4W0RScJqWpcPfuEXf9HXZvJDwYGQ2I=; b=p1p5WHB30y3ruy
	1FyWGCnex3amfYSkQ/00tH2uboqWnVx3ujDo/z6V1pMMV/UlJ2gH4H96yULdMZgTQqc21YyhhdzMQ
	cA9RElSuJDQ61a+YE+kX1TstSk8HM6bi+nRzhkSbusY2AR4gnKLU1pRn59yJQVuoldPRgzixJAyY2
	c0kF3rYwfMmaDGLS1BRdEnXTwNVL4E/Y4XnVkH9Mg/D6NnY/gaiCZ1Oc33YfYKLeprlFuGHLxJEHo
	fLVkMBTUZw4yzUjoGx1+lt1AZY04LfohQdBRtfe0ph2hNpuDeFUReorMzONMElhfzcmZjDrzPXrW7
	QcrkQKTEfxCGzKf4ax+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64tX-00000003FHh-2RmH;
	Mon, 14 Sep 2026 11:30:43 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64tU-00000003FD2-3HED
	for linux-i3c@lists.infradead.org;
	Mon, 14 Sep 2026 11:30:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789385440; x=1820921440;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u5GN9lVpjpXRd8vJC9Hh8socSV48mdkeYAlWgxTGzhc=;
  b=NeLoP3Z1HwIIe38rW0ZvZ6JX6NTq1zM6bV7U+pzt/8v9vXnyAJqUzf9S
   C/T4eGx1y2s1AP2vf6cCviOSZxZvuMwB4mVS1H8s9CZEyquNPOKJgF6a1
   Ilevh9RiMLYwOVWRUlwsusiGaEwb94SnXRf4LwpxcZumCUS9G34Dax7ps
   2kUBcldlX6/0qHUpVMwcfGICzVhDdcXbELeysODGnRbF/8ckV2QcpeekI
   bXWK+nrm+1qyvX514GHoQiitJe0N5Kz5n1rObjZV7diBS7lF1F4HV6koP
   72rGeCGenSAy4lKx0ZM/W+btdUwwqkI4DfrA0kiMViBeSmYFkRBjH+lo4
   g==;
X-CSE-ConnectionGUID: Lv5Cz9GTQbOyoXe8ZZX6lQ==
X-CSE-MsgGUID: 6Of6uIVhTPuEkX29z3XyeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89864486"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="89864486"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:30:40 -0700
X-CSE-ConnectionGUID: YYpTKAQBTFCIc3tv/OIA7Q==
X-CSE-MsgGUID: 1Au/JSzkRPSoItr2YqXFFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="273133141"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.35])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:30:39 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/17] i3c: mipi-i3c-hci: Fix Response Descriptor DATA_LENGTH mask
Date: Mon, 14 Sep 2026 14:29:58 +0300
Message-ID: <20260914113003.183150-13-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914113003.183150-1-adrian.hunter@intel.com>
References: <20260914113003.183150-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_043040_838201_56877030 
X-CRM114-Status: UNSURE (   8.74  )
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

The I3C HCI Response Descriptor defines DATA_LENGTH in Bits[15:0],
with Bits[23:16] reserved in all published HCI specification versions:
v1.0 (Table 91) and v1.1/v1.2 (Section 8.5). However,
RESP_DATA_LENGTH extracts Bits[21:0], incorrectly including six
reserved bits.

Update the mask to match the defined field width.

No functional change is expected because compliant controllers return
zero in reserved fields.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/cmd.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd.h b/drivers/i3c/master/mipi-i3c-hci/cmd.h
index 7bada7b4b2de..e0d4a6e0e319 100644
--- a/drivers/i3c/master/mipi-i3c-hci/cmd.h
+++ b/drivers/i3c/master/mipi-i3c-hci/cmd.h
@@ -24,7 +24,7 @@
  */
 #define RESP_STATUS(resp)		FIELD_GET(GENMASK(31, 28), resp)
 #define RESP_TID(resp)			FIELD_GET(GENMASK(27, 24), resp)
-#define RESP_DATA_LENGTH(resp)		FIELD_GET(GENMASK(21,  0), resp)
+#define RESP_DATA_LENGTH(resp)		FIELD_GET(GENMASK(15,  0), resp)
 
 #define RESP_ERR_FIELD			GENMASK(31, 28)
 
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
