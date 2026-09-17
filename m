Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD27C982D0
	for <linux-i3c@archiver.kernel.org>; Thu, 17 Sep 2026 19:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FOVMdaBIlksXMPgCXYQWL1SaHcklg/3/1ZHHDBd415k=; b=vdZ8Z5E+tMXhOe
	xUak3gr7cOwPS15GtjozTNy7uR8W2bfwZ6D6XKtkgT611XjNS3TufMSO7SuLzbnV84NySOwa1KHhT
	vC9PC+n1L2hHSMdCqJsFfB2ZW4XZNyUMcYfpBvpr4MfwScVmzAM2OXRHt1+VimVP2JOoC8uZO+e5M
	rvSmrYW1HRkTr8jPsrE2qMKDZHrMy1eupPSml4J6AR8R6iCQ9hk4bRCtM66y1bcGihBUfSWCEscjB
	Ty/lHwrpTWdZd9/9WMfGDQZ5YNe/MbuUwhOiIxYBW/1F44Lm/HSwr9E45dmcmhqnDUXstxWW18C15
	M6C0GK7cfsUmljSOPwKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7HZ5-0000000CJW2-3GiB;
	Thu, 17 Sep 2026 19:14:35 +0000
Received: from mgamail.intel.com ([192.198.163.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7HZ4-0000000CJFz-15JE
	for linux-i3c@lists.infradead.org;
	Thu, 17 Sep 2026 19:14:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789672474; x=1821208474;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1IBS9TcW8iwf8Wot5JZR8RPd1EsQzugRVyv9ZPA98gQ=;
  b=igg3kriCzFFnhwxqANypbB1APgwdK/Mf9VEs9FxFbfoiAAvI/fLYTQ1X
   YrmocJQKfmImMmx2ZbPlSgyHWwtM2y5CFy+ugMpzCEZcWx/rFgX8dyKCO
   4Djc8m6x2fZ1gCcgga2N9lBW4JjPt/sCUJtQ1sFAmf58pq++gQCupPMpE
   FMzwsEMlEUfegWmf//0m22j3gumYXIcRATP9+KQCbQOu6Ly2xRgMh3GTi
   vVdU18uortvpCGzfi0iBLePEFUiyHgB2pjbyACdf6lO1Fgo29eebZXMkx
   c3Ua7LZxjckTESWElb6Ott/EPPkc75KfgLIerWUkM5h/c2CI1UdaqpZR7
   g==;
X-CSE-ConnectionGUID: 7xF7IynkQYa/I3vuL9eewQ==
X-CSE-MsgGUID: LJkmKaXuT9GhrG5T0Rsq/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="639972"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="639972"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:14:34 -0700
X-CSE-ConnectionGUID: jBK0WX7mSMylube3TxvwAg==
X-CSE-MsgGUID: JEq0OZQSR1+eLsHa1pA1YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270272012"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.5])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:14:32 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 14/17] i3c: mipi-i3c-hci: Remove invalid HDR-BT and Fm/Fm+ definitions
Date: Thu, 17 Sep 2026 22:13:53 +0300
Message-ID: <20260917191356.133242-15-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917191356.133242-1-adrian.hunter@intel.com>
References: <20260917191356.133242-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_121434_313389_1985C76A 
X-CRM114-Status: UNSURE (   8.08  )
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

Several HCI definitions describe capabilities or modes that are not
defined by any released version of the I3C HCI specification.

HC_CAP_HDR_BT_EN uses a reserved HC_CAPABILITIES bit. Similarly,
MODE_I3C_HDR_BT uses a MODE value reserved for I3C transfers, while
MODE_I3C_Fm_FmP cannot be encoded in the 3-bit Command Descriptor MODE
field.

These definitions are currently unused, so there is no functional
change.  Remove them to avoid implying support for non-existent HCI
features and to prevent future misuse.

Assisted-by: GitHub-Copilot:claude-opus-5
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V2:

	Added Frank Li's Reviewed-by tag.


 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c | 2 --
 drivers/i3c/master/mipi-i3c-hci/core.c   | 1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
index 3b9345718d27..9910df53c013 100644
--- a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
+++ b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
@@ -108,8 +108,6 @@ enum hci_cmd_mode {
 	MODE_I3C_SDR4		= 0x4,
 	MODE_I3C_HDR_TSx	= 0x5,
 	MODE_I3C_HDR_DDR	= 0x6,
-	MODE_I3C_HDR_BT		= 0x7,
-	MODE_I3C_Fm_FmP		= 0x8,
 	MODE_I2C_Fm		= 0x0,
 	MODE_I2C_FmP		= 0x1,
 	MODE_I2C_UD1		= 0x2,
diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 4629a16debc9..7a39be64c4e1 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -55,7 +55,6 @@
 #define HC_CAP_DIRECT_COMMANDS_EN	BIT(18)
 #define HC_CAP_MULTI_LANE_EN		BIT(15)
 #define HC_CAP_CMD_CCC_DEFBYTE		BIT(10)
-#define HC_CAP_HDR_BT_EN		BIT(8)
 #define HC_CAP_HDR_TS_EN		BIT(7)
 #define HC_CAP_HDR_DDR_EN		BIT(6)
 #define HC_CAP_NON_CURRENT_MASTER_CAP	BIT(5)	/* master handoff capable */
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
