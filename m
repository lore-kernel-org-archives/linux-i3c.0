Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 656BFC982DA
	for <linux-i3c@archiver.kernel.org>; Sun, 20 Sep 2026 15:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z9VRQqBqKLqDlCJODl/ZHzqQPGIhAlfbwV83hy1HHac=; b=j2ZFmfPhwnBV7H
	AzcL1zH4SXjNuTsxykCdqc3pdQBwBR7RVVEYHO0YBeNor5WvwkEFCYyioe7bymEDQbsBWOKKwRAr1
	mIO3TFaUYHztvZ9ZZcPZISgOktVqlsPYT5YQk0ocuzWLgE6fWJImkeiDU1dsEOX5EH9KGRo7COIfT
	43YzdP9oB5WniQd43NUNMtsm7xXmxrrl8QU5SP5ESGvnCUursKaf+DrxrwYu2mRoGbfcjgpN9FHw3
	nwY6RSXCB8KmxG6P/qKx0i9Y7eqaKqusAczJFh4U5D9w0SajxBBYBb72qea6axWxgugIeF0u86q+P
	2GlS158bShYLYKcgcb3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8JEP-000000002di-0Ton;
	Sun, 20 Sep 2026 15:13:29 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8JEK-000000002Vr-1tav
	for linux-i3c@lists.infradead.org;
	Sun, 20 Sep 2026 15:13:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789917204; x=1821453204;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LvCS1J3n7zGwydqW7aquNU9PxD92uK+FL8mwwGGF+aw=;
  b=lmxZ/YhrsTwuzFLDX84nr46vweGIqFfajiILc3YiNkJcGtQoEt2L9259
   o46IuvjUuyf5mPiDFey1jvkDHO6UTH1i/8eGwX8kGlmzGl7F5clZnuyVf
   bcPuSt9mK5kSIo8Sg3D1ZvwaXD57MqS3ufJjWYL6yZlFItmW35JB/va1d
   naHXYJkxvno2qXV3OYmLT//DZFS4rvNY5MWt8P1lnlBQrxYVIJ6KAmB8/
   7nIzfw3o5XWc+ogIMtBEl8tgNQoqwr31henONII+LlPrQ7BejZ0PIOo7W
   2+dG6xmJcQ9iS7qpVFraEZydywiJen947FnDBHPJ7g0MLI1ujIw6+KOcM
   Q==;
X-CSE-ConnectionGUID: yjWbj/UKQnivCUSsOMtnYg==
X-CSE-MsgGUID: Zowg6eTpRYqQLoqL+AfMYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="89548474"
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="89548474"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:13:24 -0700
X-CSE-ConnectionGUID: dA7X5oIGT/Kt3PS5b+8SXw==
X-CSE-MsgGUID: na0SVeBxRIyAtZqNWe568w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="3352439"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.82])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:13:23 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 12/17] i3c: mipi-i3c-hci: Correct RESP_DATA_LENGTH to bits 15:0
Date: Sun, 20 Sep 2026 18:12:42 +0300
Message-ID: <20260920151248.46936-13-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260920151248.46936-1-adrian.hunter@intel.com>
References: <20260920151248.46936-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_081324_504054_7E35B5F6 
X-CRM114-Status: UNSURE (   8.38  )
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	Added Frank Li's Reviewed-by tag.

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
