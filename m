Return-Path: <SRS0=/dce=4P=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25049C4BA24
	for <linux-i3c@archiver.kernel.org>; Thu, 27 Feb 2020 11:31:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7F5A24696
	for <linux-i3c@archiver.kernel.org>; Thu, 27 Feb 2020 11:31:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h6NZKms8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="URetjbda"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7F5A24696
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=0Om5UQ69KmbwomGKbPe1QRSul0s8/K9PAwBol1t4zT0=; b=h6NZKms887LpLKq47/VS6wQlfS
	KK2HEBBK6FARVlvEezZtO3God/eIG7EnOf6ynwJ5Ks96Zrgx8Y5mP8MpDYIAnf+RyaXamA64y2EJG
	TJ/wu51vsjr0Z4smWGh8drDYRgvhjqD5QBaSQpsVlAwUZYc3cV6VzBY0R5VqKq+RE2iRwydeWRFPR
	VrsfO3qOV/Gcybj0DS/+LY2cIJobXeAWuACrkJKTQzz5kLITcCyfBWmQv7zEtfGbgoGxvaGVoaJ1g
	5om4o8VDgkcgJ/G0Qp6sBfV2qoPMUi6e8ScILtw+BDMhVPvH7HhKlYdz2HZFhCyqXxYFv1o8TAy3S
	/TKuUdgA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7HOE-00066z-Ox; Thu, 27 Feb 2020 11:31:38 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7HO6-00062w-RI
 for linux-i3c@lists.infradead.org; Thu, 27 Feb 2020 11:31:36 +0000
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5B4D6C0AD1;
 Thu, 27 Feb 2020 11:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1582803090; bh=nnsAv9kQ8j3lGYt/imLE7LxPTTFBc+oOVMrkSeC4fMI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=URetjbdaQJuKFWZwAWWsxk24JtycNe7lMt715a7o3mbnSwc7B0prMJMUMYx6bRO8N
 3JMS6WkgBFd8HrhMN62qbuoBGZvtEkJ153KZbv/5r83GkH37mmFV42PFv+EZLMHvq7
 YKc/NLbH8W42KDLTlJGtQozymUwYjaMX3jwr68dC7N0FPTcEeFe0uZlN/ND91Deodr
 9x47ohEDpCwCrn5AlmXsJOJIdC5tXKVpmrxlOfnIKGXjnlH+SuBLVBcYxxXkaSJlaV
 K0EKjMwi1ST8KdL8cj+X9mdzf48YhzxIRFBTOXwETSNj3REybPbhUlxvnrczm5yBC/
 XuNHZg1UEc7Iw==
Received: from de02.synopsys.com (germany.internal.synopsys.com [10.225.17.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id 817A5A005C;
 Thu, 27 Feb 2020 11:31:26 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by de02.synopsys.com (Postfix) with ESMTP id 6FBB83E9E7;
 Thu, 27 Feb 2020 12:31:26 +0100 (CET)
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: pgaj@cadence.com,
	bbrezillon@kernel.org,
	linux-i3c@lists.infradead.org
Subject: [PATCH v2 3/4] i3c: Generate aliases for i3c modules
Date: Thu, 27 Feb 2020 12:31:08 +0100
Message-Id: <79687073b915182e06fccfb18adcedfd0fadbc99.1582796652.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1582796652.git.vitor.soares@synopsys.com>
References: <cover.1582796652.git.vitor.soares@synopsys.com>
In-Reply-To: <cover.1582796652.git.vitor.soares@synopsys.com>
References: <cover.1582796652.git.vitor.soares@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_033133_477890_0C04ABA4 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 linux-kernel@vger.kernel.org, Vitor Soares <Vitor.Soares@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

From: Boris Brezillon <boris.brezillon@collabora.com>

This part was missing, thus preventing user space from loading modules
automatically when MODALIAS uevents are received.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
---
 scripts/mod/devicetable-offsets.c |  7 +++++++
 scripts/mod/file2alias.c          | 19 +++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
index 054405b..d3c237b 100644
--- a/scripts/mod/devicetable-offsets.c
+++ b/scripts/mod/devicetable-offsets.c
@@ -145,6 +145,13 @@ int main(void)
 	DEVID(i2c_device_id);
 	DEVID_FIELD(i2c_device_id, name);
 
+	DEVID(i3c_device_id);
+	DEVID_FIELD(i3c_device_id, match_flags);
+	DEVID_FIELD(i3c_device_id, dcr);
+	DEVID_FIELD(i3c_device_id, manuf_id);
+	DEVID_FIELD(i3c_device_id, part_id);
+	DEVID_FIELD(i3c_device_id, extra_info);
+
 	DEVID(spi_device_id);
 	DEVID_FIELD(spi_device_id, name);
 
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index c91eba7..f81cbe0 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -919,6 +919,24 @@ static int do_i2c_entry(const char *filename, void *symval,
 	return 1;
 }
 
+static int do_i3c_entry(const char *filename, void *symval,
+			char *alias)
+{
+	DEF_FIELD(symval, i3c_device_id, match_flags);
+	DEF_FIELD(symval, i3c_device_id, dcr);
+	DEF_FIELD(symval, i3c_device_id, manuf_id);
+	DEF_FIELD(symval, i3c_device_id, part_id);
+	DEF_FIELD(symval, i3c_device_id, extra_info);
+
+	strcpy(alias, "i3c:");
+	ADD(alias, "dcr", match_flags & I3C_MATCH_DCR, dcr);
+	ADD(alias, "manuf", match_flags & I3C_MATCH_MANUF, manuf_id);
+	ADD(alias, "part", match_flags & I3C_MATCH_PART, part_id);
+	ADD(alias, "ext", match_flags & I3C_MATCH_EXTRA_INFO, extra_info);
+
+	return 1;
+}
+
 /* Looks like: spi:S */
 static int do_spi_entry(const char *filename, void *symval,
 			char *alias)
@@ -1386,6 +1404,7 @@ static const struct devtable devtable[] = {
 	{"vmbus", SIZE_hv_vmbus_device_id, do_vmbus_entry},
 	{"rpmsg", SIZE_rpmsg_device_id, do_rpmsg_entry},
 	{"i2c", SIZE_i2c_device_id, do_i2c_entry},
+	{"i3c", SIZE_i3c_device_id, do_i3c_entry},
 	{"spi", SIZE_spi_device_id, do_spi_entry},
 	{"dmi", SIZE_dmi_system_id, do_dmi_entry},
 	{"platform", SIZE_platform_device_id, do_platform_entry},
-- 
2.7.4


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
