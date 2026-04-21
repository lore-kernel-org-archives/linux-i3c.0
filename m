Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B75F94CA0
	for <linux-i3c@archiver.kernel.org>; Tue, 21 Apr 2026 17:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PbD9D73SdJWL6fHvbHKmlnt6KCGyEo5CbduoIxzRWCU=; b=rgm14XxuW9SN9Y
	t2EMjt6X4/gR0WLT2NCqiwRl4/2BGl6Np0uLRdEurWZGLga0I4Ut1s1X3Iv2eTPuWwUjyZ4O568sK
	jX96hRu4QfwoB/e14wyXBIV44XfL7Jj86dg17xN9465fdwSSQ89+aIE8vf4S38yXfQZ83QfjKDmA3
	c92oCtaRoDe5SVW8udrLnPl8tas74o6iMahoHCM1Zu6hpL7Ue/s/8uwcgGMiAlyF4tRcdLTxcHQ1M
	Rc1gQLQlKTalXZHldcyZAnHN8Set2phYG6gL9Gj2qYhhCLF0d/Xvm7a+hKcp6qEsq8hW2kg2rdszc
	rrs2bi02DcKbOPKg74Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFFJH-00000008zUP-40rO;
	Tue, 21 Apr 2026 17:54:55 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFFJF-00000008zT1-31La
	for linux-i3c@lists.infradead.org;
	Tue, 21 Apr 2026 17:54:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776794093; x=1808330093;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7R5KiZVWPGMisYuzQJsEbYOq5Z5KTDBUHJNw2BHSXtQ=;
  b=SYVyD8BbAI/zWhMeyrruymToMVpIrS/nsznYNtAXNv7zuuPa95m2iBO1
   LmCIzWoF2APfRUHMzLjtJTLmFkqka8cygkBHit6RPS8cZQUB5SuiKPcPq
   gf4SpAcuh0g14x+cYmTxKCwoGwdxYYALKogDRuxUnlcfB2aDmHHpWLSXz
   7oU3S3o3Q55A/QVEhHmESAJjwji0m88pTvcMgBjgZAqpf8Djq/EegjrOL
   GnyY9bmUsZ6N1G6DXKAF+TN6iVcM4/wAG1+88RViDwYM17cJssyb4axAa
   R9hvOIYztkiMM3P+OjBkHtDmCWi7C5HbUJdRUJy+E5jNFzIne/JsEAXbO
   g==;
X-CSE-ConnectionGUID: 7R5CvPANQYiyUCgIiUD6ZA==
X-CSE-MsgGUID: 2u+L86MdQa2ZBcmWVtBLRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77651346"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="77651346"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 10:54:50 -0700
X-CSE-ConnectionGUID: wGdh/BscRomcQnRPr+Spiw==
X-CSE-MsgGUID: GlehnzN7RXWMchg1J5KLhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="227494836"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.242])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 10:54:48 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 01/16] i3c: mipi-i3c-hci: Fix suspend behavior when bus disable falls back to software reset
Date: Tue, 21 Apr 2026 20:54:20 +0300
Message-ID: <20260421175435.122094-2-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260421175435.122094-1-adrian.hunter@intel.com>
References: <20260421175435.122094-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_105453_798336_C89FCC1E 
X-CRM114-Status: GOOD (  13.68  )
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

Software reset was introduced as a fallback if bus disable failed.  The
change was made in 2 places: the cleanup path and the suspend path.

For the cleanup path (i3c_hci_bus_cleanup()), after software reset the
function continues to do cleanup for the current I/O mode.  For the
suspend path (i3c_hci_rpm_suspend()), after software reset the function
returns early.  However software reset does not reset any Ring Headers in
the Host Controller, so returning early is not the right thing to do.

Instead, continue to call suspend for the current I/O mode, which for DMA
mode will reset any Ring Headers.

Note, although Ring Headers should not be active at this stage, performing
this reset follows the procedure defined by the specification and keeps
the suspend path consistent with the cleanup path.

Note also, i3c_hci_sync_irq_inactive() is still called via the PIO and DMA
hci->io->suspend() callbacks.

Always return 0 because the device is quiesced as much as possible and
returning a negative error code would unnecessarily prevent system suspend.

Fixes: 9a258d1336f7 ("i3c: mipi-i3c-hci: Fallback to software reset when bus disable fails")
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V2:

	Always return 0 from suspend callback
	Amend commit message


 drivers/i3c/master/mipi-i3c-hci/core.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index b781dbed2165..afb0764b5e1f 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -762,15 +762,10 @@ static int i3c_hci_reset_and_init(struct i3c_hci *hci)
 int i3c_hci_rpm_suspend(struct device *dev)
 {
 	struct i3c_hci *hci = dev_get_drvdata(dev);
-	int ret;
 
-	ret = i3c_hci_bus_disable(hci);
-	if (ret) {
-		/* Fall back to software reset to disable the bus */
-		ret = i3c_hci_software_reset(hci);
-		i3c_hci_sync_irq_inactive(hci);
-		return ret;
-	}
+	/* Fall back to software reset to disable the bus */
+	if (i3c_hci_bus_disable(hci))
+		i3c_hci_software_reset(hci);
 
 	hci->io->suspend(hci);
 
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
