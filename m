Return-Path: <SRS0=ktag=4K=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F330C35674
	for <linux-i3c@archiver.kernel.org>; Sat, 22 Feb 2020 10:27:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 460172071E
	for <linux-i3c@archiver.kernel.org>; Sat, 22 Feb 2020 10:27:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tILWJpOs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 460172071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3OmGo/tDXSbDWb5MUd+LdYQgL9WbSiv9chuIdB6m+c0=; b=tILWJpOsbIsLgb
	9dO7x8zewt8Ofphb6libpKiMfhjlF3xIBYI3TXvbGEsGgkDVEUcOlHnkenwWFuylVybtrzHNSieOg
	k4tY1Ez6ihfHYjUvD1kLSZgYeZodWq3tS0UGdtZZpGzK2ZC8TBJKZIB6yJiduHp7IxfmlEV1TPyAw
	yg9gHaStYgz+9W6RB+htzMwCqk2gQ3b/ZRyMcxWmlRxbGjQ6DczuYzeAPcLO6d5gc7onI2vwtIDY8
	5yEjHoYikdmtou/DXNni3iV6b6lTEXmPij99e3ccEyQI3s0uypc0zwE8CI90dd2VtbvQCuW8hMg46
	YMNXkU24fh2L3QJeP6dg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j5S0P-00063G-QZ; Sat, 22 Feb 2020 10:27:29 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j5S0N-00060A-6I
 for linux-i3c@lists.infradead.org; Sat, 22 Feb 2020 10:27:28 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D05502912E5;
 Sat, 22 Feb 2020 10:27:20 +0000 (GMT)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 =?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
 Vitor Soares <Vitor.Soares@synopsys.com>, linux-i3c@lists.infradead.org
Subject: [PATCH 2/3] i3c: Generate aliases for i3c modules
Date: Sat, 22 Feb 2020 11:27:10 +0100
Message-Id: <20200222102711.1352006-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200222102711.1352006-1-boris.brezillon@collabora.com>
References: <20200222102711.1352006-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200222_022727_363693_97E51FF8 
X-CRM114-Status: UNSURE (   8.99  )
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
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

This part was missing, thus preventing user space from loading modules
automatically when MODALIAS uevents are received.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 scripts/mod/devicetable-offsets.c |  7 +++++++
 scripts/mod/file2alias.c          | 19 +++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
index 054405b90ba4..d3c237b9b7c0 100644
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
index c91eba751804..1754de3f119f 100644
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
+	ADD(alias, "manuf", match_flags & I3C_MATCH_MANUF, dcr);
+	ADD(alias, "part", match_flags & I3C_MATCH_PART, dcr);
+	ADD(alias, "ext", match_flags & I3C_MATCH_EXTRA_INFO, dcr);
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
2.24.1


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
