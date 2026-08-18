Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0246EC5DF7D
	for <linux-i3c@archiver.kernel.org>; Tue, 18 Aug 2026 10:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QGPFIJxxgnKpblzsq8Ll5JJVD3OmtCkhCjDiL5na9q0=; b=CBxT1/+3wzllom
	z2gazjpPyeBlaG75Gl9FFwxZCZ8HF8XFWhjVwO6nxfU8qtW7S2NCGFoQADHMZBAsiISfYIdeSPBhC
	oXKP2gm3wcpZtN/CsrHGcXUi3tcWwgRHe5NSTdSkkpv2yIPiKsS2ELGjPxwqMKEjSN4oOkLrvCbGb
	2hLEQrJDmOg13SA0ANhsIQEJWWunuX0xdZL6/EaI88MklUoXbG4wchUbjSIl7N+cS47+CnsRs+5wn
	4WZbAO41JSmqwfXuLtwavjKnRRvqpp0aomXMN9rSVDgrcuQjl8UD0f+Ljb3pFSkidO+LYIYCcnN5O
	uW8QOvAfVXaFVmzGeOJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwHGX-00000007lbJ-2vx1;
	Tue, 18 Aug 2026 10:41:57 +0000
Received: from ms.asus.com ([103.10.4.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwHGU-00000007laA-3Jot
	for linux-i3c@lists.infradead.org;
	Tue, 18 Aug 2026 10:41:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=asmedia.com.tw; i=@asmedia.com.tw; q=dns/txt;
  s=asmediacomtw; t=1787049715; x=1818585715;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=q1PLEDl/ZR3JgXpW5Z61bz684z+10vVgV/m0xb/qe5Q=;
  b=PWOLpCEkVtbpDEkAM24Gnd4nywjpvFeipaaewmNPojsx2CLRb9rBAurN
   r90gPjFQFwV+UGb1tnurRti2+7bmqa3j9e3Z+KtSI/OrsnbzfK4WewLv+
   H3/fPF7UldLsLspd+MEaOVZGEywFWpL1kbO/tvZzPyj0s2CMfjIgDJau3
   c=;
X-CSE-ConnectionGUID: XmTV/XWRSAii02aKJHfxvg==
X-CSE-MsgGUID: 2YoqfDthRpOYuwuh/6EHaA==
Received: from unknown (HELO APZA006TMD.corpnet.asus) ([172.22.47.66])
  by ms.asus.com with ESMTP; 18 Aug 2026 18:41:48 +0800
Received: from mymail.asus.com (42.79.21.38) by APZA006TMD.corpnet.asus
 (172.22.47.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 18 Aug
 2026 18:41:45 +0800
From: Jian-Ming Liao <Jm_Liao@asmedia.com.tw>
To: <alexandre.belloni@bootlin.com>
CC: <Frank.Li@nxp.com>, <adrian.hunter@intel.com>,
	<jarkko.nikula@linux.intel.com>, <boris.brezillon@collabora.com>,
	<linux-i3c@lists.infradead.org>, <Jm_Liao@asmedia.com.tw>,
	<Patrick_Yen@asmedia.com.tw>, <Chloe_Chen@asmedia.com.tw>,
	<Yd_Tseng@asmedia.com.tw>
Subject: [PATCH v4 0/3] i3c: mipi-i3c-hci: Add support for AMD_PT and PIO fixes
Date: Tue, 18 Aug 2026 18:41:03 +0800
Message-ID: <20260818104106.763772-1-Jm_Liao@asmedia.com.tw>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [42.79.21.38]
X-ClientProxiedBy: APZA001EXB.corpnet.asus (172.22.6.13) To
 APZA006TMD.corpnet.asus (172.22.47.66)
X-TM-AS-Product-Ver: SMEX-14.0.0.3239-9.1.2019-30140.006
X-TM-AS-Result: No-10--14.924100-8.000000
X-TMASE-MatchedRID: rpN4nBFEV4ztZDpZlNWg4PfwPmegKHrjQahV9NsL7Q8kYXFfc6Ro56DD
	tQuUOlIMuS0uXIHV7MOt6ykt5Q8avSzTx/dpNT7jtGVDVaCpEWI65AvqzCz4MyhTyngBnQHLrcT
	PKdSSebj+aBIksyDWvKpa9LShBEW0x8vS9LM/i1Wq5lUH4/wnRlHdSSkRFiZk+wWpop+OSdwTl3
	/mhBEIUm4ZAgGgB4wWTDcPFtIVA+vmZvdrars94XByeAh9HO8gnVW5D6U48fdG6bncN29QHAmnI
	JNjpLCA3lm+1DRY284jnUGEYqYqjN6sobq2FdX6iVpFx0iXT0T47B/wARNYpv60mc1oTTHnOfKU
	eIrSi7+B1cMHtlEKnMq80Y2YbRJTr54JIx46I6QU09woo4Lw2NvIAMT/07OiB9pfNDL2PYXlKOD
	fT40pE7YURQHAp3zKF/vdJV8sGEzdezJgSuGIMTUkTr4ouAaAriQZsuO4XCSRNLqt+6DLdQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--14.924100-8.000000
X-TMASE-Version: SMEX-14.0.0.3239-9.1.2019-30140.006
X-TM-SNTS-SMTP: B170A3C8E66BFA7D76EE77D6E651D4737A385F859D9CD4B3213B4D9B12C8DB852000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_034155_158934_C60EFD8B 
X-CRM114-Status: GOOD (  10.93  )
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

This patch series introduces support for the AMD_PT I3C controller and
includes several improvements to the MIPI I3C HCI driver to enhance
stability and compliance with the latest specifications.

Summary of changes:
- Patch 1: Fix missing STAT_IBI_STATUS_THLD in PIO mode by enabling
  IBI threshold interrupts alongside error interrupts.
- Patch 2: Add explicit PIO queue management (enablement, starting,
  and stop/restart logic) for compliance with HCI v1.2.
- Patch 3: Add device ID and platform support for the AMD_PT I3C
  controller.

Changes in v4:
- No functional changes. Resent using corrected corporate SMTP relay
  configuration to fix mismatched From: and Signed-off-by: addresses
  reported by Frank Li on v3. The previous v3 send was relayed through
  a personal Gmail SMTP server, which silently rewrote the From: header.
- Patch 1: Added Reviewed-by tag from Frank Li (received on v3).

Changes in v3:
- Addressed review feedback from Adrian Hunter:
  - Patch 1: Added Fixes tag; updated commit message and code
    comment to reflect missing STAT_IBI_STATUS_THLD and interrupt
    activation on first transfer; aligned From: and Signed-off-by:.
  - Patch 2: Aligned From: and Signed-off-by: email addresses.
  - Patch 3: Restored Frank's Reviewed-by tag from v1; formatted
    platform_device_id entry with '{' on a separate line; moved
    amd_pt_info to match device table order; added space before
    closing brace in PCI device table; aligned email addresses.

Changes in v2:
- Patch 1: Removed unverified "Hot-Join" wording from comments and
  commit message.
- Patch 2: Addressed review feedback from Frank Li:
  - Removed '-' prefixes from commit message.
  - Reverted unnecessary debug line movements and cleaned up 
    macro alignments.
  - Removed redundant manual kfree(pio) to prevent double-free issues.
  - Adopted a helper macro for HCI version checks instead of hardcoding.
- Patch 3: No changes (rebased).

Testing:
These changes have been validated on the Intel Panther Lake (PTL) and
AMD_PT platforms. No regressions were observed for existing
controllers.

Jian-Ming Liao (3):
  i3c: mipi-i3c-hci: Fix missing STAT_IBI_STATUS_THLD in PIO mode
  i3c: mipi-i3c-hci: Add PIO queue management support for HCI v1.2
  i3c: mipi-i3c-hci: Add support for AMD_PT I3C controller

 drivers/i3c/master/mipi-i3c-hci/core.c        |  5 ++
 drivers/i3c/master/mipi-i3c-hci/hci.h         |  5 ++
 .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    |  9 +++
 drivers/i3c/master/mipi-i3c-hci/pio.c         | 74 +++++++++++++++++--
 4 files changed, 87 insertions(+), 6 deletions(-)

-- 
2.43.0

==================================================================================================================
This email and any attachments to it contain confidential information and are intended solely for the use of the individual to whom it 
is addressed.If you are not the intended recipient or receive it accidentally, please immediately notify the sender by e-mail and delete 
the message and any attachments from your computer system, and destroy all hard copies. If any, please be advised that any unauthorized 
disclosure, copying, distribution or any action taken or omitted in reliance on this, is illegal and prohibited. Furthermore, any views 
or opinions expressed are solely those of the author and do not represent those of ASMedia Technology Inc. Thank you for your cooperation.
==================================================================================================================
-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
