Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93189CCFA05
	for <linux-i3c@archiver.kernel.org>; Fri,  7 Nov 2025 06:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KsWtVXEsgpKfOxr+6POJqbd0gWOSIWxL+k5NpN/U3VU=; b=xmg5JDahibBnFJ
	TWDoQb3Iys3RPmvm48mvVOh4QlNz49qLiW5U1SBSFTijVJIZJVO19qhqpcSiqh0U1royQUsRCf46u
	so5GMLPvpE2uQB/1jW0jNgzLnQKi98DmPvotLEd8Ic9voSRAsp5XM7Mf9PwPc07EbvsAyYBP6t6AO
	Zj7c9AWrOFknZb0dAermwGibW6/sfn8btNCGAnV9Z48kSvY+mSvfqbLvnoCrr3CJRIUuOSEUTjgWJ
	QWlE/Kr1WrcrszFlVVDUtMMVU303o25PEOaBhwLIZFJZppXpbGf4Tmy7yFv4Cx/Vu92y4TZRTqz8y
	xZX3rb2L4aIsVNyK9D9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHFdn-0000000GihZ-1GlR;
	Fri, 07 Nov 2025 06:08:07 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHFdl-0000000GihD-0cv4
	for linux-i3c@lists.infradead.org;
	Fri, 07 Nov 2025 06:08:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762495685; x=1794031685;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TY8Yb/P7qJYVOv8w1FjGEwyX1y5nB3Fxsc8oS5hbiCI=;
  b=IIq91L4vR6+yyY90VXudMHcX4LL/TbujdGSAM8OlygalHQ8vMAMF6Gao
   WyIKgzPNHFGL6DM0wMIGPjuLn70vOXd6sqBu/7M9fdIfX56wHafZLx94H
   slTI8djycwIaCooZn7ON+/imopLIFOEoMBTnF7c4D90ZYwiM0/nuVvOza
   fYyqCF9vL/xB4f1bFXMEFpfyPlfPb/twS2yRuBk2qdyvcF4y8SpjqV4/+
   i9PrEBGGVSJ+OduMmr/0SyHdyXyiFE23FEjE6yiN0VoO7LCmWei2S6Qbb
   9FP/cvc8AXouNBs9Bd/HkfSPCpnNftVlFc1rhi5aYcOg/1xy7tinrtqBk
   Q==;
X-CSE-ConnectionGUID: 3NQ2lY02TH6UgQWut60acw==
X-CSE-MsgGUID: h2SYzu2+QMC1QGrkBds4Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="75334310"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; 
   d="scan'208";a="75334310"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 22:08:03 -0800
X-CSE-ConnectionGUID: G5TclZiUQrGz1Wa2UwdrXQ==
X-CSE-MsgGUID: sUwFCSxvR1OJaI27uH5+fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; 
   d="scan'208";a="192321013"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost.localdomain) ([10.245.245.19])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 22:08:01 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2] i3c: mipi-i3c-hci-pci: Add support for Intel Nova Lake-S I3C
Date: Fri,  7 Nov 2025 08:07:50 +0200
Message-ID: <20251107060750.7995-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_220805_248286_22495A34 
X-CRM114-Status: UNSURE (   8.10  )
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

From: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Add I3C controller PCI IDs for Intel Nova Lake-S.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V2:
	Added Frank's Rev'd-by
	Tweaked commit message 'on' -> 'for'


 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index 08e6cbdf89ce..dd4484eff2f0 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -133,6 +133,9 @@ static const struct pci_device_id mipi_i3c_hci_pci_devices[] = {
 	/* Panther Lake-P */
 	{ PCI_VDEVICE(INTEL, 0xe47c), (kernel_ulong_t)&intel_info},
 	{ PCI_VDEVICE(INTEL, 0xe46f), (kernel_ulong_t)&intel_info},
+	/* Nova Lake-S */
+	{ PCI_VDEVICE(INTEL, 0x6e2c), (kernel_ulong_t)&intel_info},
+	{ PCI_VDEVICE(INTEL, 0x6e2d), (kernel_ulong_t)&intel_info},
 	{ },
 };
 MODULE_DEVICE_TABLE(pci, mipi_i3c_hci_pci_devices);
-- 
2.48.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
