Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF95C982D8
	for <linux-i3c@archiver.kernel.org>; Sun, 20 Sep 2026 15:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5uJxPaFErp7tGcj42gksL6/bVFMYFAHrAZrnVFWQr4w=; b=fFiGu55fE+pYd+
	k58v2v5oG4TTokSqNx/zljTSp7b8Ds0OcHbly0CKEIC4kNjzn2uOOHuyHEPAbiJ7dUp4Y/5wN1yDi
	IS53Mzp5bF0a8WY+mq5Zn2kVpKleKqcvHMsCUSuuTEhKZzfIzMwaCGvghRrxq5whfsaQGfxQpYs2P
	HgI/35+X1nf4l/qGnXbxv2KyFmSbfQAzoVTovXzyceBi7C8V8qchMA+yfg6DeQgWF+1ygscd3f32i
	2F36QALKYVykjRkwUOeRMifAMbijK17JaDO1dwjrXgglp0EI39ozOR1Vr1VOakk+STjVLtnZ5ATu4
	cOqiGcH7uPFDOwNqiOpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8JEB-000000002VS-1xEd;
	Sun, 20 Sep 2026 15:13:15 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8JE7-000000002QA-475u
	for linux-i3c@lists.infradead.org;
	Sun, 20 Sep 2026 15:13:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789917192; x=1821453192;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ymg15iObztoik/4xK8BRUFnYvihNFTAPc3nnaYgSz+0=;
  b=h92jQBWK6rUzeB6/YI5pMUkWQvlVKK/0tVWCVid2eILndFzSE9XzsKaH
   fesVGKEEBZQqfbem1ZuPIOsLIFAkOPUzBCmIzTr6rfbKWHb/8+pJhXLTV
   WEHPaJAMhsORolAJfxPl2R1bMsCdT05v4OA9X7ywgJ2/EYfB/1ASIq5SJ
   IAJ5QcJ/24FFS3su3TAr/a5/Gs9iVgBS3wxDGP0HAMZfuWh/SLrb8svk7
   uXvXzL97+/bx+DI87bXaUJ4JznUT7SEX6xaj3OtTJFOlPnKbJXPyj1+tu
   +GIGO3Loke1shF8IyN0B/T3+f64TOThmdmCawq34pgJk2PLcdaFAvZmNa
   g==;
X-CSE-ConnectionGUID: TSyhQxywTCG2mx7E4ee+Bw==
X-CSE-MsgGUID: N7TRMzOMSz26rJn1DOG4Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="89548436"
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="89548436"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:13:12 -0700
X-CSE-ConnectionGUID: hA03MWy4Stq5Nya1Ly0QhQ==
X-CSE-MsgGUID: XTDot9IOTVOz4KD2ioynYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="3352399"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.82])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:13:11 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 06/17] i3c: mipi-i3c-hci: Restore controller state if i3c_hci_enable_ibi() returns an error
Date: Sun, 20 Sep 2026 18:12:36 +0300
Message-ID: <20260920151248.46936-7-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260920151248.46936-1-adrian.hunter@intel.com>
References: <20260920151248.46936-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_081312_034741_86E76A9F 
X-CRM114-Status: UNSURE (   9.47  )
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

i3c_hci_enable_ibi() performs controller-side setup before sending the
ENEC CCC to enable IBIs on the target.  If the ENEC CCC fails, the
function returns an error but leaves the controller configured as if IBI
enabling had succeeded.

Fix the error path by undoing the earlier setup when the ENEC CCC fails,
ensuring the controller state remains consistent with the failed enable
operation.

Fixes: 9ad9a52cce282 ("i3c/master: introduce the mipi-i3c-hci driver")
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	Added Frank Li's Reviewed-by tag.

Changes in V2:

	Reworded the subject, which was previously "i3c: mipi-i3c-hci:
	Fix i3c_hci_enable_ibi() error path", to say what the patch does
	rather than that it fixes something.


 drivers/i3c/master/mipi-i3c-hci/core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 8b3a87d8a8bb..166d9f70f435 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -703,11 +703,15 @@ static int i3c_hci_enable_ibi(struct i3c_dev_desc *dev)
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct i3c_hci *hci = to_i3c_hci(m);
 	struct i3c_hci_dev_data *dev_data = i3c_dev_get_master_data(dev);
+	int ret;
 
 	mipi_i3c_hci_dat_v1.clear_flags(hci, dev_data->dat_idx, DAT_0_SIR_REJECT, 0);
 	scoped_guard(spinlock_irqsave, &hci->lock)
 		hci->ibi_devs[dev_data->dat_idx] = dev;
-	return i3c_master_enec_locked(m, dev->info.dyn_addr, I3C_CCC_EVENT_SIR);
+	ret = i3c_master_enec_locked(m, dev->info.dyn_addr, I3C_CCC_EVENT_SIR);
+	if (ret)
+		__i3c_hci_disable_ibi(hci, dev);
+	return ret;
 }
 
 static int i3c_hci_disable_ibi(struct i3c_dev_desc *dev)
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
