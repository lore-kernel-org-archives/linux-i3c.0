Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47781D609D3
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Dec 2025 16:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TULkMVpFwhtbocYXP/8Aesc9FrWy5XX4apM/o9V4d/k=; b=KMd73QT7REa/Oo
	0Cu9IgwUizmFtCgFQ0eYqSlW760x7/INFLWIfp5DZ3vSxfRFK9S28kvckZ4zrTCo5/DXDEiGKzpXP
	+ZJPJcsw2wIGRo8DxpocJDgJq8SSiMaDt2jgxG2bL+hTzYEYBFGDeQHJh5aEY2ngcVAG0fikR7xbv
	HkT2iT6gDP5PdzTIq0VIhqUt+hvVwOUhrrEwMS9raCPjFXhI8HSWIOjLFo9RLO1kJFs73/iRegC7W
	fWSu4Tg/Jv1gkkaLOKcMhcrKXgqMnRqcufHJn30F9grEWXa9aBRaWHd0ZpgFluCmA+KiiijHXsflU
	FtlFxjsikHEuLVDFG+fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYM8-00000005ZM4-3IPm;
	Tue, 16 Dec 2025 16:57:01 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYM5-00000005ZKP-3v3S
	for linux-i3c@lists.infradead.org;
	Tue, 16 Dec 2025 16:56:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765904218; x=1797440218;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Kx2gjfdBSXcsAjI2/AJ9gzuhXv3okZaERHplREx1W/k=;
  b=YVw2c2yNBKvw9yO/39NCWA3VHwBcNdSiswhlc2AnvA+0YJSuR1rn+MhC
   ekte/855+IXl3/vuL+OqCKgRXjXq1hfUsy+UXh5YeHWNnSV8BLmovjL0N
   OHRGmfLfgXoM7CwfPVwMy/bTY/g0oEETmwIlxErx2TMFKjc84RBRqfeqk
   9ECwfL5xk/4IBKE6uOSLdYm3p1S4iGfzxQWhkCtVtO6lBwFxWz01KEfvg
   APJ/Oa5278u66chh5AcYZJ5k6S6S34pkht442l1BCnyLrZEI6GByfXgY9
   TYsw/Bm3yvyVLxBDrkBTnq+qXdQacSGqPxl+DnwFup2mXVdbQ8hpapuUj
   w==;
X-CSE-ConnectionGUID: Xy7vEsafSS6FhkofaB5qAg==
X-CSE-MsgGUID: wi5T3HQoQu+9m6vSCwUkWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="78466728"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="78466728"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 08:56:56 -0800
X-CSE-ConnectionGUID: jQSp7SXTSMOy4syuw8tXEQ==
X-CSE-MsgGUID: 7uvBJwoKSJqPvj+YA+jcKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="197817591"
Received: from rvuia-mobl.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.195])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 08:56:54 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 02/11] i3c: mipi-i3c-hci: Stop reading Extended Capabilities if capability ID is 0
Date: Tue, 16 Dec 2025 18:56:33 +0200
Message-ID: <20251216165642.164583-3-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251216165642.164583-1-adrian.hunter@intel.com>
References: <20251216165642.164583-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_085658_275176_6B849915 
X-CRM114-Status: UNSURE (   8.84  )
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


Changes in V3:

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
