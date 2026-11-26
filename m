Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6595E606A31C
	for <linux-i3c@archiver.kernel.org>; Thu, 26 Nov 2026 06:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wwLKJeL3;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=YbleWsVF;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=Ta5ywk+f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=dkH+2VirJn9TNPF8ANMF6Jz6pcwEvQa8RUgT5omObDU=; b=wwLKJeL3xlJ0M7h0uIDlnGXSrq
	OLx+kipSQajmWiLazk/BeA3ld4PB07ts7rh3kOym1/mp+cVp7u99xiCmCXutxd1WGV8LcAbmG8KQ0
	p0aBSdx5RRfnNA6VLIrbHrK0gK0bsvs/Nzb5vW7Pnd/KhZFQEHIm4OzB2UlEAthx1bIDvWThiuXOu
	NrT8atBZRWEqlN7rJ70u3pPqi74JnCe3JpxaQgcMLAg1Wgb966UN8nz743GIADZ/d//nbRn0YUdIZ
	cWx/kvutepOYsKB+SxV1ktR6yRgnfYktd8KvxwH22XEgDXhMSI5muYgPunY5NKqQunPFfXzWPExFL
	9CGiAaiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSlj-0000000CADR-3TjQ;
	Thu, 26 Nov 2026 06:15:44 +0000
Received: from mx0b-00230701.pphosted.com ([148.163.158.9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSlg-0000000CACr-2a5S
	for linux-i3c@lists.infradead.org;
	Thu, 26 Nov 2026 06:15:42 +0000
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ35fXR3170528;
	Wed, 25 Nov 2026 22:15:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pfptdkimsnps; bh=onYMe7z45MNHNaZv+QbTHmbUjD9ItNkD
	2Eo0MoSvp60=; b=YbleWsVFTZoKCdiiN+JCWpatzXKUYBFIIhSoKuVlcpyti8F6
	1OBcz5jmfZ80YVIcdA5EvB1yyLyTFfKsUC6L3mYtVltA71mRmc1mwC93pKxAyyd8
	SjrGfwH5Pb981yf8R8KSz/ytSxMzS+JkZIeNYJkr7mhbImhPExMDoQQgCOMNY3H6
	izlq1f+egAMD1DPhRf1K0sK3KdFpZN4YOwEjTKD231GiL9AsrWmIDcC4ISCN/R/s
	4ETlQT89JbNQzvdAPmnIWA2YePCZQk4Ez6H1d9nsXO3qndnilh0VSF9CLLQITaMz
	whzGGEhpjR0nlRFW6dul7YAmLc4IPVzMNrXsjw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4j64agbq7b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Nov 2026 22:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1795673730; bh=+4f0NTweHkkjxxVxq8bcb7YppIRlVgUdeTIheSnclQU=;
	h=From:To:Cc:Subject:Date:From;
	b=Ta5ywk+f8Q3YkZ96bhrElrEf9xQOpHhheW+yWqUqQnqeaD+3tlzNexhE8ljhFZn3+
	 /N5gtvT9GNaI1gPSzgpMhbnMWv1h02Bzso3gir9pxjDvSfoDIZZht1YSxj6oH0fsTa
	 gYLym52stou7OJzyyrcDYH/9g0rBjQ2vTcm1c4bU+MuiTLjZEAcaUQImZlbDzDToni
	 wZS3UDtgwG5bi8HY5puG06vqQ5pTdbVI1UHuhb129+PzWhTZEUs+o96nOmyH81S4n8
	 Cj6FNHPiC12czd7NvFcsqmE4m5HnFWk7xYQcoZr7zhW5NRWyBjmS7auI/ZZSeMxp1E
	 ibjN8T1dd13Qw==
Received: from mailhost.synopsys.com (eudc-mailhost2.synopsys.com [10.213.161.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8D140401E8;
	Thu, 26 Nov 2026 06:15:29 +0000 (UTC)
Received: from Ubuntu.internal.synopsys.com (snps-xodffzmzvk.internal.synopsys.com [10.155.144.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mailhost.synopsys.com (Postfix) with ESMTPSA id 2A601C16A3;
	Thu, 26 Nov 2026 06:15:25 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Dineshkumar Parameswaran <Dineshkumar.Parameswaran@synopsys.com>
To: Dineshkumar.Parameswaran@synopsys.com, alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com, linux-i3c@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jose.Abreu@synopsys.com,
        Nelson.Costa@synopsys.com,
        Dineshkumar Parameswaran <Dineshkumar.Parameswaran@synopsys.com>
Subject: [PATCH v4] i3c: master: dw-i3c-master: Add HDR-DDR support to Designware Controller.
Date: Thu, 26 Nov 2026 11:45:02 +0530
Message-Id: <20261126061502.4771-1-parame@synopsys.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: RODkNtrFZvaCWkQa4uGgBMszYyd4w-21
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyMyBTYWx0ZWRfX8ejACzS7cTvw
 8JlCczD5cA3U56uGTDwfMYa/3Z5CVLl/nOw6xlmL6/BkQHyL2E2ARO4d/xnHGfd9mP0Dvoe2OwD
 nWI6FzKlPRU1M5YVk3/MpIlDBDJ+MpE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyMyBTYWx0ZWRfX0TwbCeaKzZt8
 CJoSNh1vGinTCduSYRghpKBrs74602e1nhRUl0/mqlhWPyPmFfGxLzzSCUxgmvmQwurnHjSnU5b
 NvDeKRuUjKAZe95foDCjJGcZzPlY+d6XT7V277zrA2IlCKoPdRDtPTkSCZ+M8/FdeLrSwpZ+aF8
 sRsI1gLDnOmjfFOVsFxajykFoBJI/t/f1Jvv0YT7C17fD4GVfejNDerXEFRIqPvEWBIGLQWrJD7
 eW02ppTzfVr8zbFWxdWJruVevHtv5RF4cMOSuiZ+iXHq4+7WuKfnXLjvjMFcqymvVEU+x3tcN8u
 xEY6Zejmn0L5x3MOfVI6mGUk+NxsgS4QpeW+PKlfe1piyvQ7JsKx2+wTU1H8guwUX4f1vip15yK
 wL6XcuUWrQI0x75sAT2gsZRdkGqBvUAq6M5zSXsMRbVfhh15qXny8JjwJafPCfe7FV6lc6qL+dX
 x8k4wEHBieUHBlhnT3A==
X-Authority-Analysis: v=2.4 cv=cJN1IVeN c=1 sm=1 tr=0 ts=6b07ce82 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=zJRp6_cAMcgA:10 a=qPHU084jO2kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22 a=jIQo8A4GAAAA:8
 a=6ICTioi8pyFgEHTiPqgA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
X-Proofpoint-GUID: RODkNtrFZvaCWkQa4uGgBMszYyd4w-21
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_221540_956392_7E1F4E03 
X-CRM114-Status: GOOD (  19.39  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Implement HDR-DDR transfer support for the DesignWare Controller.
Only support for private transfers and does not support sending CCC
commands in HDR mode.

Key differences:
- Sets the speed to HDR_DDR_SPEED(6) and COMMAND_PORT_CP to do
data transfer in HDR-DDR mode. Hardware will generate the ENTHDR0
based on this.
- HDR exit pattern will generated from the hardware when it sees
the TOC on HDR-DDR mode.

Signed-off-by: Dineshkumar Parameswaran <parame@synopsys.com>
---
changes in v4:
- Fixed using HDR-DDR cmd direction instead of using rnw directly.

 drivers/i3c/master/dw-i3c-master.c | 41 ++++++++++++++++++++++++------
 1 file changed, 33 insertions(+), 8 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 05584ddaf104..d94e7a6d28f9 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -65,6 +65,8 @@
 #define COMMAND_PORT_DEV_COUNT(x)	(((x) << 21) & GENMASK(25, 21))
 #define COMMAND_PORT_ADDR_ASSGN_CMD	0x03
 
+#define HDR_DDR_CMD_READ		0x80
+
 #define RESPONSE_QUEUE_PORT		0x10
 #define RESPONSE_PORT_ERR_STATUS(x)	(((x) & GENMASK(31, 28)) >> 28)
 #define RESPONSE_NO_ERROR		0
@@ -232,6 +234,8 @@
 #define I3C_BUS_I2C_FMP_TLOW_MIN_NS	500
 #define I3C_BUS_THIGH_MAX_NS		41
 
+#define DW_I3C_HDR_DDR_SPEED	6
+
 #define XFER_TIMEOUT (msecs_to_jiffies(1000))
 #define RPM_AUTOSUSPEND_TIMEOUT 1000 /* ms */
 
@@ -381,6 +385,11 @@ static void dw_i3c_master_read_ibi_fifo(struct dw_i3c_master *master,
 	i3c_readl_fifo(master->regs + IBI_QUEUE_STATUS, bytes, nbytes);
 }
 
+static bool dw_cmd_is_read(u32 rnw_cmd, enum i3c_xfer_mode mode)
+{
+	return (mode == I3C_HDR_DDR) ? (rnw_cmd & HDR_DDR_CMD_READ) : rnw_cmd;
+}
+
 static struct dw_i3c_xfer *
 dw_i3c_master_alloc_xfer(struct dw_i3c_master *master, unsigned int ncmds)
 {
@@ -726,6 +735,8 @@ static int dw_i3c_master_bus_init(struct i3c_master_controller *m)
 	memset(&info, 0, sizeof(info));
 	info.dyn_addr = ret;
 
+	info.hdr_cap = I3C_CCC_HDR_MODE(I3C_HDR_DDR);
+
 	ret = i3c_master_set_info(&master->base, &info);
 	if (ret)
 		goto rpm_out;
@@ -962,7 +973,8 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
 	struct dw_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct dw_i3c_master *master = to_dw_i3c_master(m);
-	unsigned int nrxwords = 0, ntxwords = 0;
+	unsigned int nrxwords = 0, ntxwords = 0, rnw_cmd;
+	bool rnw;
 	int i, ret = 0;
 
 	if (!i3c_nxfers)
@@ -972,7 +984,10 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
 		return -EOPNOTSUPP;
 
 	for (i = 0; i < i3c_nxfers; i++) {
-		if (i3c_xfers[i].rnw)
+		rnw_cmd = (mode == I3C_SDR) ? i3c_xfers[i].rnw : i3c_xfers[i].cmd;
+		rnw = dw_cmd_is_read(rnw_cmd, mode);
+
+		if (rnw)
 			nrxwords += DIV_ROUND_UP(i3c_xfers[i].len, 4);
 		else
 			ntxwords += DIV_ROUND_UP(i3c_xfers[i].len, 4);
@@ -995,28 +1010,36 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
 	}
 
 	for (i = 0; i < i3c_nxfers; i++) {
+		rnw_cmd = (mode == I3C_SDR) ? i3c_xfers[i].rnw : i3c_xfers[i].cmd;
+		rnw = dw_cmd_is_read(rnw_cmd, mode);
 		struct dw_i3c_cmd *cmd = &xfer->cmds[i];
 
 		cmd->cmd_hi = COMMAND_PORT_ARG_DATA_LEN(i3c_xfers[i].len) |
 			COMMAND_PORT_TRANSFER_ARG;
 
-		if (i3c_xfers[i].rnw) {
+		if (rnw) {
 			cmd->rx_buf = i3c_xfers[i].data.in;
 			cmd->rx_len = i3c_xfers[i].len;
-			cmd->cmd_lo = COMMAND_PORT_READ_TRANSFER |
-				      COMMAND_PORT_SPEED(dev->info.max_read_ds);
+			cmd->cmd_lo = COMMAND_PORT_READ_TRANSFER;
 
 		} else {
 			cmd->tx_buf = i3c_xfers[i].data.out;
 			cmd->tx_len = i3c_xfers[i].len;
-			cmd->cmd_lo =
-				COMMAND_PORT_SPEED(dev->info.max_write_ds);
 		}
 
 		cmd->cmd_lo |= COMMAND_PORT_TID(i) |
 			       COMMAND_PORT_DEV_INDEX(data->index) |
 			       COMMAND_PORT_ROC;
 
+		if (mode == I3C_HDR_DDR) {
+			cmd->cmd_lo |= COMMAND_PORT_CMD(rnw_cmd) | COMMAND_PORT_CP |
+				COMMAND_PORT_SPEED(DW_I3C_HDR_DDR_SPEED);
+		} else {
+			cmd->cmd_lo |= (i3c_xfers[i].rnw) ?
+				COMMAND_PORT_SPEED(dev->info.max_read_ds) :
+				COMMAND_PORT_SPEED(dev->info.max_write_ds);
+		}
+
 		if (i == (i3c_nxfers - 1))
 			cmd->cmd_lo |= COMMAND_PORT_TOC;
 	}
@@ -1027,8 +1050,10 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
 
 	for (i = 0; i < i3c_nxfers; i++) {
 		struct dw_i3c_cmd *cmd = &xfer->cmds[i];
+		rnw_cmd = (mode == I3C_SDR) ? i3c_xfers[i].rnw : i3c_xfers[i].cmd;
+		rnw = dw_cmd_is_read(rnw_cmd, mode);
 
-		if (i3c_xfers[i].rnw)
+		if (rnw)
 			i3c_xfers[i].len = cmd->rx_len;
 	}
 
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
