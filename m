Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74EAFD1CDC6
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Dec 2025 02:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k41vR2kWJONQY83gKoNmEIbWLDv3CDGMdI/Pq2wYJE8=; b=tSMzFPPfRyzI0G
	/X6ZnWNKgEzELSVOrikzUDd9g6+JPJEEdysEYami7xV7BJi/rOc5Qbx9CUTZnXApYM8eT1fLuQmC+
	6cnbWeaHi75yjJOJvgAXXsizYTF6/BXfGzruOrZN0Sp6T32BctkpsrKXs+096mTetza7ZFOHcvlJk
	d4sEOqNCLcitTjOeF7+o6gRXHWvSotWSCFG1JLQegAMHdWZygo3TTiVHTrIHCB5iWwgZ97SA6Hz9B
	HnQI5G8KoL8KLXbnQ6apOneNCodaOMlb1gjQ1viNAx4AXMZa18ecNGmQks4dq16k4pIC+d2vhs+IE
	1UsmoZJ/V+Myd3XtgCpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSQfU-0000000CSKD-0pdE;
	Mon, 08 Dec 2025 02:08:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSQfQ-0000000CSJB-0mk6
	for linux-i3c@lists.infradead.org;
	Mon, 08 Dec 2025 02:08:01 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B7LwJM13567175
	for <linux-i3c@lists.infradead.org>; Mon, 8 Dec 2025 02:07:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Z4PAnE/yqkTOg1ruCwzzZqM1TMQuF5RPnCi
	SVKm8OPY=; b=l4NBm3uJscm+9uvZqUI4wrHJsFoVUVYf0NwBg6eMwUX+ei9855J
	Pn3GiDstOcXf+ELTRIOjuzTI82eTdpcEJiytvWv+NG99k5/33/yeUN7wE67wrjJR
	DHfcyHR+jsnFPgz00podObcdPhXUC8HXFB+SOAQpsyKY4gXWXJuBJRKO+OIo0mp7
	RT2KLxALQS8JhOcVbG1Rl2/k0PVTHDUMjWoj18MiF1uFdCXCRsyQSE2SBFC/+nRJ
	vavV3+m7/my8GB9ZATlbsTp5bpUx49iivg+PD92g8zXHIcUnMGH0WhgyUOuvdxeJ
	24xnbvnAxIv1s5AiwK44H+ybxf0Ys1aF1NA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avc2wkb0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i3c@lists.infradead.org>; Mon, 08 Dec 2025 02:07:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2958c80fcabso88012715ad.0
        for <linux-i3c@lists.infradead.org>; Sun, 07 Dec 2025 18:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765159678; x=1765764478; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z4PAnE/yqkTOg1ruCwzzZqM1TMQuF5RPnCiSVKm8OPY=;
        b=hmbVs2W7DAb78hRd8/xu05TGbgxj33k+rypB7bPZbD+Izj/Q0QPu1gca1sQpwJE7qf
         cyL/L6HHRoYVhVno9QKrB8d3odHgCa4P5htyFyJjRBmr1D/+JVx7LsoeHKy8fSWHSEx2
         wlUOKMDjiEuPO0LV1qqWANcIQaAmh729oK5SDhi88zvCRyNEwOTZ3wq4TalTMqoysNW8
         BZdCZurCH0n5z7WtIsilMHP0TZ2ReXOJW5FsUzPisEn1rxmeMKxzRBm5PKELN8SkyrCL
         iz4LvqyRZjDV1YSbFcAqr+SK+sNcxBGPu3FaPxHF6nbLvUtH4S5V917QFpEVq15AP8iv
         y1KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765159678; x=1765764478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4PAnE/yqkTOg1ruCwzzZqM1TMQuF5RPnCiSVKm8OPY=;
        b=TmxdC+B5ykh+0vNfvJHzaDMV7Nb88bO1FsYUeUFG4GeFUuG4kgRp6OctD8sVsDJSYP
         HrLmLWpsSYM5lwb5pQk12WT4tTC44vpX3UlnNyV1aCKM4rjq18VpozzDloCygPjlWkmJ
         ROXKc9jh6y5uL7cTKBZZj93dNQMBfwB9rTtXg4IvR8QUwbhaS8ijdd5q+326Qob1yv5C
         T1rFYp75370PLTcytIgtWYUKdcC4JLdKdLm9hLOd3M3I3BG0GXHy9r2zmEEk4d1L6JCq
         0m1f/+wvje/CVp6F9GhIzlChA9okywyOxsTeCy2w/djYIqgjnDTq7GTrJUHmn6QgRRYV
         CebQ==
X-Forwarded-Encrypted: i=1; AJvYcCXq1z7zaZK1L44iOf2xsJ4ioKHaU0z/5tiAynSEZCeaICHkKR0nDHCunwHinhp9tQcoT23gcge5alY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwxqjN6i9shQsSxG5BVHfj85y11RXzzhy6StTuRGpOYy1QR/OBF
	PR1Fn/HyLE3pIqrPFq+Iujdl14cqUMUSvxHFP1dgtncuT/KzsuFzU6/vetLtDFT1I1GPQdqyjbI
	7UgjvsSnaRzW8SwMLd+6YOJkzLRcTN3XRLM0nO2YsnFiS10stGzmLzwBPKgykDFuVp33D
X-Gm-Gg: ASbGncsX9nkeHQ2fo35W/nW1nLOQBuUgEu+JcU5FKXjV7saiNg/+43YLeJesTI2o+KT
	nVX787TyTe4kUCFP/PAjFIXJULPY0yCtQGpwFbl9rCuP5nMaieKgd3uqIxsFlq3SYWn83Ygk+I+
	0BezBtuHpZF1BolvyglkVTcwRro4BXnI2Tx/4SA1ZF9fptp8tAD75xoqkh4zCGVV7In9p5Lf1ch
	gyrQNg1KyxQDFVxfDJEvRmQV4ekeYucUWOAX7si4ryIHS65P5xj5nyasj3tNJX+iBoe4U/x8+5W
	EypKmKRsOF4mvqXnV5OuNQRTI8fSF+KjAFy1fxnPntFU/w+NwUvN8vqFTkGuJAHqDsxw3nN5ztN
	hlENfgIV+GAWH90rB1MxADwXQl6b12NJlvpguB059EOsSbtnp1i+Fcjzn
X-Received: by 2002:a17:903:4b0c:b0:298:2e7a:3c47 with SMTP id d9443c01a7336-29df5e08275mr58966125ad.42.1765159677705;
        Sun, 07 Dec 2025 18:07:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHabO+MbAOfRtTTDuGj+4jqr7iEYkYPdl9nA9oSaqK7y/TZbtKeNsZwCBloHvd7GKkcFTLMZQ==
X-Received: by 2002:a17:903:4b0c:b0:298:2e7a:3c47 with SMTP id d9443c01a7336-29df5e08275mr58965875ad.42.1765159677199;
        Sun, 07 Dec 2025 18:07:57 -0800 (PST)
Received: from quoll (fs98a57d9d.tkyc007.ap.nuro.jp. [152.165.125.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae49caafsm109233795ad.11.2025.12.07.18.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 18:07:56 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li <Frank.Li@nxp.com>, Jorge Marques <jorge.marques@analog.com>,
        linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] i3c: master: Fix confusing cleanup.h syntax
Date: Mon,  8 Dec 2025 03:07:51 +0100
Message-ID: <20251208020750.4727-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1643; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=nXIIM34u7nIWY0UUn8B7ukn/Kutp0gNoL5cbUgPQhnM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpNjL2n9HTu+TAR2yZXTP1wuGgyG/Sb/2kheS+K
 afBhysKmLmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaTYy9gAKCRDBN2bmhouD
 1wy3D/4842h1clavngV/X5H08HM5xG8KZKkUfo1ytt1ZHEEaVajrCQbDi5LBqdZvQPzX1H7XIgM
 L976oxLBxTUmt0twEG9qx66Vq3bp9AhwXK5N94Hc9rhc69/m375Ycn7QIJ1RJ76nX+IIw1qr4RD
 53isYKtFRMjY0aNUjzhbeKBhIBini15aYwqFfyQQ+sB8hdpMpojks7lk5tb56daGmWjknmR+5Hm
 1IyqT0Q15tbmioxeYoAF+s9sBZVe0X6+QrsaBuaddm+txZ42TwPeyDR+95HnlPr4LQ2d2KhsXSn
 AGv+C1Anl5iSQW3B6WGY0stjl3Ll9xBYw9ci5YGRpEG40kTDhZnJRHgxa807YbFz03rYZcpJvaE
 1bk17Squhw+6kl2IPfsWS/VnvOEf87IaoACGsg+S4DU9hkPIovpyIXW1MMhvyZeEjUjxvzJL+ak
 4hcNYUX/4XGJRaKFGPyhzRTv4t/wAj19kOgZ14HgUoMn0ScGgzmOTahElLmrD+C0/1WtGt0pwGh
 dBnzcTK2Cl/iyYkXUoAwjYjVjOzWST4X2oLwPJMtYu8WbiHZ93VC0xlWlkY76/9p0oww9Joau30
 u8CVIYQCike3HaHVlkG9sISZS3u/5YZXnt9W7Jr1rF++d3/k3+bfu7PN3bYvIaGtZHEJvvfH/CW xlw0XnxLlgOmrlQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: 1NVtLyfqGbFY0XtCAMrBSUbcNgUpmuj0
X-Proofpoint-ORIG-GUID: 1NVtLyfqGbFY0XtCAMrBSUbcNgUpmuj0
X-Authority-Analysis: v=2.4 cv=d774CBjE c=1 sm=1 tr=0 ts=693632fe cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=vTE1kzb4AqIx7XBf0Bkr0A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=mRTYNMK0NxNN2QSY2QIA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDAxNiBTYWx0ZWRfX6rQNmfc91DhT
 Dkvk7NlTbIa9ddhPjD987Fz70zqnjmsHjtapPX70r2H+0BAeuHq0qC3OKCvbamWqonbtqvNo/px
 DtffM9SRDehBWC2GrNbQbvSsH+0c7IbTHIZPARv6tk4u2M5nVl1CvDVMJqGjYvi4ONXe+17yvuZ
 9kVzo5UV4bbhhLi6Fu2jpKxEi6wuquBlVth3gl5BBj1Y2korxJlBshon4mQYgdAIP/ZToAocgFN
 Gel6L+Ei57oRpkGgP6BqbI6m7Rkq3HUrQZ6U5V6eQk+nbfaL3+tmCXa/Lt+11BzB5HkB5CYNWOC
 S5KlYUVh5mxMOCXCjEGD4X+sCczBSGZ237tSK4mss/X/fuO7ZhK8eO001JRSbEQ51tdYJW4G0FT
 qBXQl47wFJ3PK2JgTdgNjysYb4PyAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1011 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_180800_344380_6F8E1732 
X-CRM114-Status: GOOD (  14.03  )
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

Initializing automatic __free variables to NULL without need (e.g.
branches with different allocations), followed by actual allocation is
in contrary to explicit coding rules guiding cleanup.h:

"Given that the "__free(...) = NULL" pattern for variables defined at
the top of the function poses this potential interdependency problem the
recommendation is to always define and assign variables in one statement
and not group variable definitions at the top of the function when
__free() is used."

Code does not have a bug, but is less readable and uses discouraged
coding practice, so fix that by moving declaration to the place of
assignment.

Not that other existing usage of __free() in this context is a corret
exception initialized to NULL, because the actual allocation is branched
in if().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/i3c/master.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 823661a81f5e..62437a899cdc 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1742,11 +1742,10 @@ EXPORT_SYMBOL_GPL(i3c_master_do_daa);
 struct i3c_dma *i3c_master_dma_map_single(struct device *dev, void *buf,
 	size_t len, bool force_bounce, enum dma_data_direction dir)
 {
-	struct i3c_dma *dma_xfer __free(kfree) = NULL;
 	void *bounce __free(kfree) = NULL;
 	void *dma_buf = buf;
 
-	dma_xfer = kzalloc(sizeof(*dma_xfer), GFP_KERNEL);
+	struct i3c_dma *dma_xfer __free(kfree) = kzalloc(sizeof(*dma_xfer), GFP_KERNEL);
 	if (!dma_xfer)
 		return NULL;
 
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
