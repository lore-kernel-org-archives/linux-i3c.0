Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 240F5EDB7CC
	for <linux-i3c@archiver.kernel.org>; Tue,  7 Apr 2026 08:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dLHhzPh7k4RHsQkfk6jGsulfQyvFROm6gkSn2FkJllc=; b=1yZxMfHcwLLZa5
	2sm+HR0jZxnjZDsEpnMcVpn5LmzyNKnoTMXACAaPW7lUCAZ6VH1agOYRc0erH7aZAd7Tmw+TAUyGI
	9GNmIfsTYojlBrZhxouv7IUXpYmPGMTEjlzdq5+GFTfVi/rk66cXAcbCHKjRuYlCVlZNu/lVSj9bq
	qsgYIQ99ywxfrvxOAwdix1LLOf04qt26MAhh+y+BGuCkGofDcGPziqAblKFhjHiZ0Scr3pZHHW/Uq
	c9rXt2XsQLQIP3LjvIvPCuGZTbN65qQyutoA9DfCIO7r6a3pnHce7laggPhRlCvD4IustmsRErBaR
	6cZVRrbbu3F49dMS3ZmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA2Br-00000006Bb8-3cCs;
	Tue, 07 Apr 2026 08:53:43 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA2Bo-00000006Bam-3SBp
	for linux-i3c@lists.infradead.org;
	Tue, 07 Apr 2026 08:53:42 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 7 Apr
 2026 16:53:31 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 7 Apr 2026 16:53:31 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Tue, 7 Apr 2026 16:53:23 +0800
Subject: [PATCH v2] i3c: mipi-i3c-hci: fix IBI payload length calculation
 for final status
MIME-Version: 1.0
Message-ID: <20260407-i3c-hci-dma-v2-1-a583187b9d22@aspeedtech.com>
X-B4-Tracking: v=1; b=H4sIAALG1GkC/23Myw6CMBCF4Vchs3ZML2DAFe9hWNTp1M6CS1pCN
 IR3t7J2+Z/kfDtkTsIZ7tUOiTfJMk8lzKUCim56MYovDUaZm7JWo1jCSIJ+dGid4061z5pbhvJ
 YEgd5n9pjKB0lr3P6nPimf+t/Z9OokRvypmuorkPoXV6Y/coUrzSPMBzH8QXjuPl8qwAAAA==
X-Change-ID: 20260331-i3c-hci-dma-3aae908b4e8e
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Nicolas Pitre <npitre@baylibre.com>, Boris Brezillon
	<boris.brezillon@collabora.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Billy
 Tsai" <billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775552011; l=2295;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=Or/zZZGLrrzPf2EdaVK1/ziZnZ6hjMOXO4vgwgcl650=;
 b=n8SoCbmdq9dZlD9L3DECW4FtqqwkcCsYNGvzBj+fZVVvyLgCWvhT/VY/TWhpJcBakudWVnuB2
 op5cfD0Ab3zCW2uLURKWURhDkgaaOmOa5SaLq+t782ujqDoTK+UmPXl
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_015340_897888_3B695D40 
X-CRM114-Status: GOOD (  12.84  )
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

In DMA mode, the IBI status descriptor encodes the payload using
CHUNKS (number of chunks) and DATA_LENGTH (valid bytes in the last
chunk). All preceding chunks are implicitly full-sized.

The current code accumulates full chunk sizes for non-final status
descriptors, but for the final status descriptor it only adds
DATA_LENGTH. This ignores the contribution of the preceding full
chunks described by the same final status entry.

As a result, the computed IBI payload length is truncated whenever
the final status spans multiple chunks. For example, with a chunk
size of 4 bytes, CHUNKS=2 and DATA_LENGTH=1 should result in a total
payload size of 5 bytes, but the current code reports only 1 byte.

Fix the calculation by adding the size of (CHUNKS - 1) full chunks
plus DATA_LENGTH for the last chunk.

Fixes: 9ad9a52cce28 ("i3c/master: introduce the mipi-i3c-hci driver")
Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20260331-i3c-hci-dma-v1-1-e5cd295c44ff@aspeedtech.com
---
Changes in v2:
- Fix IBI processing logic to properly handle IBIs without data payload.
- Link to v1: https://lore.kernel.org/r/20260331-i3c-hci-dma-v1-1-e5cd295c44ff@aspeedtech.com
---
 drivers/i3c/master/mipi-i3c-hci/dma.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index b903a2da1fd1..c7272155c486 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -721,7 +721,10 @@ static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
 		if (!(ibi_status & IBI_LAST_STATUS)) {
 			ibi_size += chunks * rh->ibi_chunk_sz;
 		} else {
-			ibi_size += FIELD_GET(IBI_DATA_LENGTH, ibi_status);
+			if (chunks) {
+				ibi_size += (chunks - 1) * rh->ibi_chunk_sz;
+				ibi_size += FIELD_GET(IBI_DATA_LENGTH, ibi_status);
+			}
 			last_ptr = ptr;
 			break;
 		}

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260331-i3c-hci-dma-3aae908b4e8e

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
