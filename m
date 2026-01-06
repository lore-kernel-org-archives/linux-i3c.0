Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4DD8CE9D7F
	for <linux-i3c@archiver.kernel.org>; Tue,  6 Jan 2026 16:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VvJUGLlptwxDyDK5UvYnCqcwUDUvMNDWqMqqQCWkBoQ=; b=VVFpXKeluAAhRg
	WrB9kRoIlJdZP+FTecJiVuBkX1y7NGMQru7MU7sOx7BklbVRNNWDzWkJed1Ap/S2RAmC0WvqlRorZ
	MQ4JOzYYGJXei1iNo4EOrRp5NXXuq++97UpSJNvvl/+TERBTKnboboyMle6AkXbYwA0FmCX1KHU5O
	nayuVa6pRHZ750/Abtb/pbwoCHAN/lw5ksLAfhZzs+sMeprRw1VtoiqI/qsBsxbTw+CVLn5Mwsk2U
	KtFJs7BM4OVPDaaHd6FSysVRLNEr/HmiFOIBu6VrPJDiG4f7HZXimSIn0JsFBwIJpCykcHMx55Q1s
	kOVHHojkAXFd41gPVkxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAAo-0000000DWOF-1wmQ;
	Tue, 06 Jan 2026 16:44:46 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAAn-0000000DWNZ-024E
	for linux-i3c@lists.infradead.org;
	Tue, 06 Jan 2026 16:44:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767717885; x=1799253885;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pBLi5QdZHc8jvU0ZvCP8in+AJcRkuzqcV789+uxELok=;
  b=EXfPSHpik5ZljBy/3HJkB2WrNKw4w2SI999toKmxmLt7nze+HFkqLGYR
   MmxozcG7P94kPOWQaI3/HqcakiJd63HJLxGMC7FIz01XTSN1+U3E6rQ3p
   /2vBt1OBTQJguowX3Wj1TU3dW0Jm9cmQKmdeUH7IBU9C7C5+TYLGDrK6U
   MEIehPcvtz+KgdDojfg7/eufkq1YtZXeWQIXaq789yabPleuczACTrr+7
   y7bkF0VYYj07vqTRL80Hqu0Vx9/qZ5WlF/shi3rBPrd6zyw/5z9lkZP1v
   uS6XQzSUa4zyWb5vT0LNtc+fSLQ6FnVjMIj7awqa/OH+S2yGVX3lghHM2
   g==;
X-CSE-ConnectionGUID: Kv6+e1RdT7ytxYVlYAPTOQ==
X-CSE-MsgGUID: f81M0zCoTY6s3NVKi+G1QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="91741820"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="91741820"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 08:44:45 -0800
X-CSE-ConnectionGUID: 78Dk8tO5SRWKfBcJp2FtbQ==
X-CSE-MsgGUID: UDDVZqUkScKFdo/exncFTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="206838020"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.254])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 08:44:43 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V4 02/11] i3c: mipi-i3c-hci: Stop reading Extended Capabilities if capability ID is 0
Date: Tue,  6 Jan 2026 18:44:07 +0200
Message-ID: <20260106164416.67074-3-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260106164416.67074-1-adrian.hunter@intel.com>
References: <20260106164416.67074-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_084445_082709_3F0A917A 
X-CRM114-Status: UNSURE (   9.69  )
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

Extended Capability ID value 0 is special.  It signifies the end of the
list.  Stop reading Extended Capabilities if capability ID is 0.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3 and V4:

	None

Changes in V2:

	Add Frank's Rev'd-by


 drivers/i3c/master/mipi-i3c-hci/ext_caps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/ext_caps.c b/drivers/i3c/master/mipi-i3c-hci/ext_caps.c
index 40939af0b0e3..024bccf23fd0 100644
--- a/drivers/i3c/master/mipi-i3c-hci/ext_caps.c
+++ b/drivers/i3c/master/mipi-i3c-hci/ext_caps.c
@@ -271,7 +271,7 @@ int i3c_hci_parse_ext_caps(struct i3c_hci *hci)
 		cap_length = FIELD_GET(CAP_HEADER_LENGTH, cap_header);
 		dev_dbg(&hci->master.dev, "id=0x%02x length=%d",
 			cap_id, cap_length);
-		if (!cap_length)
+		if (!cap_id || !cap_length)
 			break;
 		if (curr_cap + cap_length * 4 >= end) {
 			dev_err(&hci->master.dev,
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
