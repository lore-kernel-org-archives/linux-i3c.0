Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E73C88E72
	for <linux-i3c@archiver.kernel.org>; Thu, 17 Sep 2026 19:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QAZiodrEDuFseaFtbwQ8I+tZcKx5mZePTrWQ6gDqF5w=; b=Rjtogv5Skiqrtn
	dqFrBjJlgRihIPFsqoMhKfTp5167cgCXS9KFxh/LqvWp3tIwl/vMate9uhBS9d4ckEyM+Ysxobrhs
	p4EUHYHifnKASaJpIy9IHyw+qXPDpqQtAmef61t+RnmLFOyh73urssz4/JHCSyoYogn61uMyI7uQt
	TZ0Y+D10SHlYq4TbAGYTUbelSN0WOuYr9SbHlyf/9A+Wpp+CYzoXILI6QHvMoI/WbkuyXfk/ZrI/1
	wYbj+tLn88W6D70+jnx9Vs/NxoH6ho5dZfbAWzK/TdCkcEt6AIvBJucULlviCIjk1xptcPb3M4mA0
	3BEAq4UoJ9Ic7AhvKUEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7HZ2-0000000CJU4-2mGt;
	Thu, 17 Sep 2026 19:14:32 +0000
Received: from mgamail.intel.com ([192.198.163.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7HZ0-0000000CJFz-1MKM
	for linux-i3c@lists.infradead.org;
	Thu, 17 Sep 2026 19:14:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789672470; x=1821208470;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h/WQ1CySimtto27MKEw6h0kwRBGh80WpJZja5OCfoIA=;
  b=XSEH6/pvtV9fI7aBFszAWbb4stB9jb2eJyhYBpSmwpMD7OdPC3mW6nHf
   IjXGC8tPtAAwZu4PxpdiZwWiY184NDW0V3QskdLGDTHXiWQ2u5Y1iMdqU
   u8dI8ppFuNiX9Vi4xQnRQ2ixQuzrsQs/3LLptPV8oVIxhuWqLad+d3U8j
   E0sMSsUwhGW3dIg3/AvsdiUk5hlekH8JaR7iQkW0BH0LpPWK+G56TE0La
   TsV2HtXoKHGxfzXInoGvFFswkix+vSlvwpjSBXjyJp3OmgsQDDgg/oz3b
   /Z9UdtnsSb2+WiOVAgvJNjehlGZij38X1kJbQWqyGTRDJZ0cGYvrmLyFZ
   Q==;
X-CSE-ConnectionGUID: TiynFcy4RJ29+GBdCJnpcQ==
X-CSE-MsgGUID: JnQcwNrUSj2xQYJTaqIqMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="639959"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="639959"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:14:30 -0700
X-CSE-ConnectionGUID: xukVB5gZT/aDry/nMGmvaA==
X-CSE-MsgGUID: GWdMM/17SyejzLevKBySiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270271999"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.5])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:14:28 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 12/17] i3c: mipi-i3c-hci: Correct RESP_DATA_LENGTH to bits 15:0
Date: Thu, 17 Sep 2026 22:13:51 +0300
Message-ID: <20260917191356.133242-13-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917191356.133242-1-adrian.hunter@intel.com>
References: <20260917191356.133242-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_121430_370818_7A9F20AD 
X-CRM114-Status: UNSURE (   8.47  )
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


Changes in V2:

	Reworded the subject, which was previously "i3c: mipi-i3c-hci:
	Fix Response Descriptor DATA_LENGTH mask", to name the macro and
	the corrected bit range.


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
