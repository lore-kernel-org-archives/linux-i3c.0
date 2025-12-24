Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA27AE75452
	for <linux-i3c@archiver.kernel.org>; Wed, 24 Dec 2025 12:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d2bKZr0IcJDQ0f1YhMyJLplgYcfHlYy7aUABIOf7CJA=; b=uXQtmqCjdSV2KN
	b5dt8k/OMOHJdS/yhSiwxJu8RUhjELjauSMlHcstfvi2nhxeyZRrYqRCezHSXuWtV5jDtekwUT+Sv
	4sDm3x4SyjxFuvGuk4ikBMw/65ShfhVtMra/FHMsImXWVciGKIiaCerRlw3Zsx0DDHbADAMVYv6MU
	BhQn9cjO7RzZIsxlq3jdo0+nTnnyyXQqTYxsNV1WNsCjnxYRcbkKuvKY5a4ZiyhmBkrrEboJeDhj5
	m0DJT/a7mDeCou7OFhhO/2rEV+65q7RIsqSKqKa0RpohZC4nsrPQUbIAXxdpLyckwiAz98KfEJdog
	eixdrVAupWGC8EMvVlCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYOG0-0000000GoWl-2H7k;
	Wed, 24 Dec 2025 12:46:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYOFY-0000000GoS6-2GQz
	for linux-i3c@lists.infradead.org;
	Wed, 24 Dec 2025 12:46:20 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO8O2Wa721269
	for <linux-i3c@lists.infradead.org>; Wed, 24 Dec 2025 12:45:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bPcxatoAZw++IloVzGj2swJqf8DFr+0rXvj
	SMJZwA84=; b=IQdA8UCM0/BoqFzM5DFZNce9x6gKy2lzreob8VasX3fEa0vhA3f
	v+ldpRFdbpYNK90Gal/LGmFHx2Zs+UprL+pN3WNo30xGk51wIwqzPF36QbPkfCsl
	3Tod5u0KA1e4Gs29T8MtoP7241/cF1d9CvutZLWCo//pMJKprz26YL/g5x+7ZWHJ
	M4RcUvsmPbQ10D/FzqmxgbSvzGnQB53+VSElyYtnREeB79JNL81itLc3d7Yk2/iu
	rMRcfDVD9FyzDvYumlbGTBS4Nfdu+geMa95HKPAgniQWZ3wyPGsf1L5YJgdtzG1k
	yCnlyWBn+fA8AhhokmmmJRqhsdHZqxGanSA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b81mta7xs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i3c@lists.infradead.org>; Wed, 24 Dec 2025 12:45:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed6ff3de05so164072231cf.3
        for <linux-i3c@lists.infradead.org>; Wed, 24 Dec 2025 04:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766580355; x=1767185155; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bPcxatoAZw++IloVzGj2swJqf8DFr+0rXvjSMJZwA84=;
        b=GtENZR2RH+BnwuGrM+lsU0AObfnd9ttIPSjztSX6/RdssAy7v42eyciCh5fxYAqeeA
         AL18F6dWi2x7zgo5/pD5YXdUlLw26n2Oer/HRU9FoX+Irq3n9ZSX0wVafqNM05BsFvQZ
         D11xpa6AO7smCXRaMN/RLIWz2PYUAIGlJZJtMN/jhQRf5y9vmPT2OwEhtQa047RFAGfe
         qacSd3oFqcKi2Ca5nv7cfekH25ElgjS9IQneDPr4W2571U1Je2GqaXXPwGXGzmE2GuzC
         JPbnRczbhiF5tmzryOT1wL4v5lveJYwEw/DZSkbWfBvLsdmF3eXfYZXehvJ11aXm9pEp
         LTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766580355; x=1767185155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPcxatoAZw++IloVzGj2swJqf8DFr+0rXvjSMJZwA84=;
        b=plia6fTWqxtC3SVaOVZq3yUwR4ud9U4GSZKgO4qUftyab0+oIzQIVOTm5cY4B9Z9ro
         lb9uLRQ17aii0NEKzx544QoWedNaht4I8iZposRkFch0DrtFO5t434qn7zzMxvpo5Z9z
         bAowN/CCMXq8gfgqztfML4uQUM/QrWba97Hb/prORSbKLgWDbI/M4wJdUEXeTI31WYdo
         vzi7FMTiE7qXhghwHV6NHnFRTBC2g+xqJk0faDJA0QiF+puPMyNROWfjImFV6pOgHQre
         vC6XsuJ7oMgmDa4V5ieccOCicQ71pCWIT6q2k5fCxDp3qDxXeG3LK2pt97xYJhacVcok
         oKUQ==
X-Forwarded-Encrypted: i=1; AJvYcCViE9a0CXoJEEM2DEC8SY9h63ArHO0HEL3ytOs4sxN+xwRPEuXHksatl0326Y4LHqYlHh4JOPywmQo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwfofKzqSf8hje5ZKTc1NNsfvfmuUMQ38guJKiF3bwni5tYe5ks
	HrU+XIG4TxQaZt2vTgG9RfFNdgsPiJwUSglI6yzZ+62nZfY9OYzKoCkh1bRcbBgyQi9iuEHAxsO
	OjsvAVBMvPRuBpvGeffGumhMG91xsPyPv/s/BLRa/5wzgQ7uox3ATZtFP3DAR+pyoXCfF
X-Gm-Gg: AY/fxX7lq+gNQi5FpB8BUUom6XJUwPJhQ8UxLpmUeb/XcyUnoI2iPsuJfX+iArQP6ZA
	QLbJCBakReL6D/8UJOm5NLbTTciDZ3RcNq9rq2kt3IVvXEWcyvLdxKl4RCtMZ6eRLpOJk8rpHvI
	dDFb9AUBV2DACT7hyPNOB9gw8VRhu2FEK/z3U3c69WopUx+ho4OuOwE6n9UTtUlk1UmCeIX3sBr
	Ui4HCPuS8t5d95hLD6C3bjaSbY7aaqXRuo0ZIMdGYKxMTtf7KQYGk7YBIfG2vqb+dI/K92NwhCn
	oKd5sPl9GPn4uzAM4Al6VfSkVcRJwZog2t43U7pLoUxT4PDEEA7Lrlm+A3QW1rWf6d3z208LzWZ
	MURAATBvPxQCmbETkn4Eeh+owVmaEIbhE8zfGjg7DwQ558+uqYPwdMJ5D1Tj31HJxX4V1UQ==
X-Received: by 2002:ac8:6f0c:0:b0:4ed:8ab:e7aa with SMTP id d75a77b69052e-4f4abccf14emr235217301cf.11.1766580355068;
        Wed, 24 Dec 2025 04:45:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7yOlTdf8MpQJjQAjqHTsNBm4TzN+nR4k//Z5WJ7iizZ689861gq4tjy0D6sUmZksMIoFBWw==
X-Received: by 2002:ac8:6f0c:0:b0:4ed:8ab:e7aa with SMTP id d75a77b69052e-4f4abccf14emr235217111cf.11.1766580354730;
        Wed, 24 Dec 2025 04:45:54 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a614b7sm1774751066b.1.2025.12.24.04.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:45:54 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] i3c: master: Simplify with scoped for each OF child loop
Date: Wed, 24 Dec 2025 13:45:52 +0100
Message-ID: <20251224124551.208778-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=955; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=R+MFBNnRAfkrKmubnq2FvKWq5ojqYfYRaFKt3bk5fiA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS+B/4DcTGySl5qCTw36l/8PTn0meYH9Az0QDL
 gRSAm5oESyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvgfwAKCRDBN2bmhouD
 10z9D/9eXEVwyHI5I1Vs8fadRhhJTKpi5diERLvFO+C0YUFggXfKcrmaZ5QEVLamQq3HsKAk0ls
 CpUhXf3HWFwGp05sgQIlmj247CSEWC/bNG1Cbrz7P2WYchPcQ4/5VcxPU0fOz1wA1JpbMLBb6Oi
 o9b/wsuLhd36JeGFbOEfBoQ7YwtzhaA11R8kk+Wg2y26U3d6eDEXjs/Fn78+HNGjdyI8GhKKVz8
 PvSB5i3jWjMRpPt264NqK6vdrVtLVtym3aWquQLKYO9HD2FY/9PrxjYLn5zGYEr2VrYyxkae2fA
 +69Uv0DcEGZhYGzLYTgeNvqwF4BJQE74rp61YMws/+rHzeLhB1kX8QOhEXuRQrWowvgYj1OAh6q
 IcouRWyevU6N02BdS/ZPkMbz/e7jgZ7eUiyWv6/mjMYLVLqOCa0nyPHXC174z5a4dZt266pR816
 Oe0vhbIXUWneH728nn4E82ZBErTBT5kyT28r9TzDBsTro58/AUWFbEM9Uy9tw2gBj51iL1jk3iE
 HpiSKZF81wtQE4+p+eN+MFKYfmhDcUHb4YqvkrBOHyPSNjp41FjoZhY+eTbwVQonZ5BrwluoB8g
 ZD7FWtwZdyE52ULCeErmNiqS5QJCF8s6P1T4r/0a4glEkvYe8FsOGIWw9CUKTJCCQS3mmnyQV9G 8wvGsdSTSX9eehg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=e/ILiKp/ c=1 sm=1 tr=0 ts=694be083 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=h8-D3lXrgsvIcsImSe8A:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 5SrFaajc5MF_xh3gaAdTdSaDhO30l2Y9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDExMCBTYWx0ZWRfX6BHaTV9A7bdZ
 UafHD48VXNpXYWmE7kBnU5sFkPSgSr2PktZCMNnMm1ON+BeHFN6U3K1yDzrRY0pXpZgwnQPIIeP
 TwvmWRfA+IypZDcxgQy5yyEwJYV6gNb2yfPVnYaz4+SU6B+BXvzRzrtS4X/xOJOxZWrLouNFb7W
 YUJvcjbEsvTZW2dEk81jasFycrLU21XUNVns2p5X+qGEby0bJqHQUaEzOdwfvMu/CarXYWZZ6bb
 FssN4v7ZhPo7U88cj8ZaLp57EsnHCDv3sxd1muS2gqys5+skSM5ePiqPu0Nv4lp5FZMBEKGuVrY
 uqbKGDOWb5Shze6iH8yrWiu0AMMRpFFcVmC3lW1GS9TOiAi4kO7d04VuEABe70Y/h4EQ0Z7lsH3
 2B8H+VDkJvi8azO/2elx9iINZ4tsQj9KGLzvsM6mHugZi0dH1FCAxAcX5bVgVzGM+NBDIKGCsSd
 9Er6k9UEsKqlUe+SXCA==
X-Proofpoint-ORIG-GUID: 5SrFaajc5MF_xh3gaAdTdSaDhO30l2Y9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_044556_756767_2DCD869B 
X-CRM114-Status: GOOD (  13.18  )
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

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/i3c/master.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 7f606c871648..b789ac390937 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2370,19 +2370,16 @@ static int of_populate_i3c_bus(struct i3c_master_controller *master)
 {
 	struct device *dev = &master->dev;
 	struct device_node *i3cbus_np = dev->of_node;
-	struct device_node *node;
 	int ret;
 	u32 val;
 
 	if (!i3cbus_np)
 		return 0;
 
-	for_each_available_child_of_node(i3cbus_np, node) {
+	for_each_available_child_of_node_scoped(i3cbus_np, node) {
 		ret = of_i3c_master_add_dev(master, node);
-		if (ret) {
-			of_node_put(node);
+		if (ret)
 			return ret;
-		}
 	}
 
 	/*
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
