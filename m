Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE34C982E1
	for <linux-i3c@archiver.kernel.org>; Sun, 20 Sep 2026 15:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zg3esWe3SFJsyvrZY7MExfO58G0m9/7iwsvVF3/sYB8=; b=AFnSr8yuL/dM0Z
	6j0Mr0c50Hot3HELd7dlbfULmtpJIw1KHrPpEez2MHg96t6cZpbWVTsUaqmFN9Tc8cV+h3SIc0k/j
	2w3SsnAjMZBSgMgGawLA2GX9LuMimPQ2sW/L7nN0s9YqsMeOtOtJbH3wKSsmqkk5CZzw5LcmMl7xQ
	Lgsnu1qgiOHwwEQT6q5PxhAmyOKbjWtLzgA9qbOHHGIq3MtyY8o6IRJtFSNYCTHF4hIuv3GHA9XgY
	OgzeapUt57C4k2IJVDzcjNXtUw4Ppd5RSTZbFhoL0GMDGSAp/h2fClWq7Zm3mhs7qQD/QmHYWfzzD
	ow78LNW/1AHZxqrXfC3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8JEX-000000002iI-1gZ4;
	Sun, 20 Sep 2026 15:13:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8JEW-000000002hX-1Xv4
	for linux-i3c@bombadil.infradead.org;
	Sun, 20 Sep 2026 15:13:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Z0Dilk2qnvzJiihDGB79hitEoMXBQxb4Y2lSEsMxFIc=; b=GcOsMta5czhPNe+qdOIfnZDmPd
	RLHh66i1RfbdAVHKoatMf71xpRaF1WHCsVphAW6tbim2b/jstdiGhXHiHgDGT0a+1dVspPRLsnAu+
	6dm0Bf09eSFWrn0RCWk+wSv+5gLdRVtK2VZAAfR34jsUB3Xm9IU/Pfja7qTrSk5X1+vggFmsSdfPa
	5mPE0FdrAagfYG7CjZSgM8QqknZYQedBFTMLoWVERaG2RkrudYVnYKOEOjNR/FEAAR67c6rfNZKbg
	ppLzck2L7NnPuDEC7QdYArJDI66SaBuL0bQj+VhUP14UMLmesBu3EZMs/JCzt8p6qwUT+4tjBGCXQ
	TGyCFX1A==;
Received: from mgamail.intel.com ([192.198.163.18])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8JES-0000000BSnr-3FUt
	for linux-i3c@lists.infradead.org;
	Sun, 20 Sep 2026 15:13:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789917213; x=1821453213;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RXVuBSnKZWaEPolC0Z/CcYsfmBjzOLdMt+LByjCo+BM=;
  b=Iw7MxRx9dL10ZGbyNYHY/rWpwIvZ1GMhaAXbEeU3tuZEF/Cs5/GO5LQ0
   xE4gET0CSHQtkybLTqnL7S649HZ3VmPWtm31cjoPSdGBwMHV87O2Z5ejq
   Yl8rXtlWRKmXLTPde1TOEuwxfqB8WY3ZQ1WW0lhQEO/2sDQf1pcCMolks
   5fKGDXODnF/REsVKVDyXEFRCqah17eln/KZdkXxv7cOSsCRhtLjQO1gz3
   3uS2srwcqcijpfggZCMHvz7Fudi5DbT4uUOrCup5YllAsn5LQ5ua6gZpo
   iS0om09mQwzfBVU484u9G6LFvngeHT0tpqVEaJDwLbrOdk3b3NZHM0AQS
   w==;
X-CSE-ConnectionGUID: L3jVpjYARl6MrIecK1orPQ==
X-CSE-MsgGUID: M3H3LihyT2GPSzQYgAeXmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="89548484"
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="89548484"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:13:28 -0700
X-CSE-ConnectionGUID: ntIJgJZzQRCivt/mRUGLvQ==
X-CSE-MsgGUID: 3NrkezccQbmnu1cH3zdNWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="3352450"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.82])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:13:27 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 14/17] i3c: mipi-i3c-hci: Remove invalid HDR-BT and Fm/Fm+ definitions
Date: Sun, 20 Sep 2026 18:12:44 +0300
Message-ID: <20260920151248.46936-15-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260920151248.46936-1-adrian.hunter@intel.com>
References: <20260920151248.46936-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_161333_493679_D057A40F 
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


Changes in V3:

	None

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
