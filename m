Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9556E606A31B
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Nov 2026 12:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g99Qzk0m;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JE6bZeWt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9L8g2oNBgtnTkRJto8yj7w3jSKO4+iR79y/bxkiePL4=; b=g99Qzk0mR3sGNnsJkUxWoPYMEH
	Gc91lakAxfi72U30LiEaNdutCe/72NpkX6ZJCO/qFGWXWv0ZK+RDpm873VLLUpkvzf3mDELgbHQlm
	SAXsdHDDYDeBHBbV6jLOQFvIRF9pqs4B/yTyIwUk3L+cQgitReufyiOs7mMXXpWwbvnOijeJFVnBo
	mM/eqoOnctxS91quByMc/e6sd1VHViORcAq2ws/zo0dYVRzlpE3ab7/UcMC666ju60v4pCVaFbsyB
	Zvtc53igGUftFih8+tPfDwKINN7BHSerqD2awYOR8g5j/WeRwGEWu7JvKGQSQPBdFld0IGMKFywgl
	SAVv3YSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOa0T-00000005INV-1SNk;
	Wed, 04 Nov 2026 12:22:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOa0R-00000005IMP-23AY
	for linux-i3c@lists.infradead.org;
	Wed, 04 Nov 2026 12:22:20 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZuhC739250;
	Wed, 4 Nov 2026 12:22:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4RJ6M+JjySa
	y4WKw8KPrIRm4D2pO/biJ5kqHdcznYKs=; b=JE6bZeWt5bssPi8MBM/xGRSO2qy
	gb+wZH28kPzdpFvwe3EBi+GxCqfIxpYiYDkXdErM12Rmpo0TMzTraFzgzdL2EXGA
	TpTpddxbmtYW2uvmG5dod1kV9l2u3YBWc3fDOIi00OpPfiM57yRTagElig5PZ0Wf
	M6uTrgP3awfMOMxNbdRya2WpxMyLvabWP/z1jMwqEB52xGCuz6HziybhQnKrtyxU
	s54H0iZIzk85eGGDMNMvE8soYayIMsiEGWywqmh5QYtz891DSLQOT4mJ0cqIEDiD
	sCbbPG3Y1MLrhytDidecTqvzxVynmYugXmyzjai74KvQoshLYeFeBMIv0Pg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr163gxqp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 12:22:07 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4CM4hv2768554;
	Wed, 4 Nov 2026 12:22:04 GMT
Received: from hu-devc-hyd-u24-a.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.147.246.140])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6A4CM46l2768540
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 12:22:04 +0000 (GMT)
Received: by hu-devc-hyd-u24-a.qualcomm.com (Postfix, from userid 429934)
	id 3EBBC21577; Wed,  4 Nov 2026 17:52:03 +0530 (+0530)
From: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
To: mukesh.savaliya@oss.qualcomm.com, alexandre.belloni@bootlin.com,
        Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, shubhrajyoti.datta@amd.com,
        shubhamsanjay.patil@amd.com, adrian.hunter@intel.com,
        manikanta.guntupalli@amd.com, linux-i3c@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko.nikula@linux.intel.com,
        wsa+renesas@sang-engineering.com
Cc: konrad.dybcio@oss.qualcomm.com, andersson@kernel.org,
        jyothi.seerapu@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com,
        aniket.randive@oss.qualcomm.com, praveen.talari@oss.qualcomm.com
Subject: [PATCH v7 1/3] dt-bindings: i3c: Add support for Qualcomm I3C controller
Date: Wed,  4 Nov 2026 17:51:53 +0530
Message-ID: <20261104122155.3789346-2-mukesh.savaliya@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104122155.3789346-1-mukesh.savaliya@oss.qualcomm.com>
References: <20261104122155.3789346-1-mukesh.savaliya@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: o6q6M_eV9LymZ9g3zrq6R8d9GbELgoYy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfX48NtdwRSk3TL
 mDUI8C44zrEzlB/tn61x8cB1x2cJpqCuP69rmR/SpkexyPbqVtjrUizSWZ4ue70W7Tz7ouXzI63
 9I2cM6pNXqi7PQTvY+jf7f0hHEh+fPA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfX3Vvz3htA9h8r
 6012QGrzYro84lgEi4/F2yZEgKd17/uMKcPqhd/I4hy+tFZ6oS4OrNJBv7TRytyDwwqgIvRX5MB
 ZXkkagPxoq7Iwe8aIVAWT9abYja5AfghGpH58s/yb41hAZIo3KjewhSaRQ0dhCOa1FXxcFcfaUp
 JD9kvhGVWtiFqv4tbhXuwX1TA4sqlW3sQQnbBErwH5JZSjAW87MlvhOHbi+eFjSyeIwnLcJTIMe
 IF+ge5WxvAMlTgvMI9IQZtm6EazZuzeO1JoM2tmQrMm2slat408EfsmFWaWlRMztS+0+aWRR7Oy
 2HYz/4DrRfPBZr6a7mkOlrst2WeiXyBz9/ng3rFS5ktAjmLkwp09HuCn4tvIHEn+ehS2ReN/Sb8
 MNQUCFnXBWQ+LeHK49XJh0rfUoc0iAza1A3MTiR1OsuAkuFV1bMMBDot/ITwzKKzZneXdg9X+Hx
 tFoDkeuET080g5DvElw==
X-Proofpoint-GUID: o6q6M_eV9LymZ9g3zrq6R8d9GbELgoYy
X-Authority-Analysis: v=2.4 cv=O5OsLx9W c=1 sm=1 tr=0 ts=6aeb236f cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=m-1na6zgiUrtrnXSVq4A:9 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_042219_525331_5B88BBCB 
X-CRM114-Status: GOOD (  14.10  )
X-Spam-Score: -2.7 (--)
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

Add device tree bindings for the Qualcomm GENI-based I3C controller.

The controller supports I3C SDR transfers in mixed-bus mode with both I2C
and I3C target devices present on the same bus. The binding describes the
I3C controller instance along with its associated In-Band Interrupt (IBI)
controller used for handling I3C target IBI events.

Document the required resources, interrupts, clocks, and dependencies
needed to represent the hardware in device tree.

Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
---
 .../bindings/i3c/qcom,geni-i3c.yaml           | 115 ++++++++++++++++++
 1 file changed, 115 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml

diff --git a/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml b/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
new file mode 100644
index 000000000000..bab89aeee23f
--- /dev/null
+++ b/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
@@ -0,0 +1,115 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i3c/qcom,geni-i3c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Geni based QUP I3C Controller
+
+maintainers:
+  - Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
+
+description:
+  Qualcomm GENI-based I3C controller implementing an MIPI I3C bus master.
+  The controller supports SDR transfers in mixed bus mode with both I2C and
+  I3C target devices present on the same bus.
+
+  The controller consists of a GENI Serial Engine (SE) responsible for I3C
+  bus transactions and an associated dedicated IBI controller(IBI_C) block
+  used for Hot-Join, In-Band Interrupt (IBI) handling and management of GPII
+  resources associated with the I3C controller.
+
+  I3C controller nodes must be child nodes of a GENI-based Qualcomm Universal
+  Peripheral(QUP) wrapper. Refer to the GENI QUP wrapper binding described in
+  Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml.
+
+allOf:
+  - $ref: i3c.yaml#
+  - $ref: /schemas/soc/qcom/qcom,se-common-props.yaml#
+
+properties:
+  compatible:
+    const: qcom,geni-i3c
+
+  reg:
+    items:
+      - description: SE (Serial Engine) register address space
+      - description: IBI controller (IBI_C) register address space
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: se
+
+  interrupts:
+    items:
+      - description: Core Serial Engine (SE) IRQ
+      - description: IBI controller (IBI_C) manager IRQ
+      - description: IBI controller (IBI_C) GPII IRQ
+
+  interconnects:
+    minItems: 2
+    maxItems: 3
+
+  interconnect-names:
+    minItems: 2
+    items:
+      - const: qup-core
+      - const: qup-config
+      - const: qup-memory
+
+  pinctrl-names:
+    minItems: 1
+    items:
+      - const: default
+      - const: sleep
+
+  dmas:
+    maxItems: 2
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - interconnects
+  - interconnect-names
+  - pinctrl-0
+  - pinctrl-1
+  - pinctrl-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,sm8550-gcc.h>
+    #include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
+
+    i3c@884000 {
+        compatible = "qcom,geni-i3c";
+        reg = <0x00884000 0x4000>,
+              <0x008c0000 0x10000>;
+        clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
+        clock-names = "se";
+        interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 796 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 797 IRQ_TYPE_LEVEL_HIGH>;
+        interconnects = <&clk_virt MASTER_QUP_CORE_2 &clk_virt SLAVE_QUP_CORE_2>,
+                        <&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_2>,
+                        <&aggre2_noc MASTER_QUP_2 &mc_virt SLAVE_EBI1>;
+        interconnect-names = "qup-core", "qup-config", "qup-memory";
+        pinctrl-0 = <&qup_i3c1_data_clk>;
+        pinctrl-1 = <&qup_i3c1_data_clk_sleep>;
+        pinctrl-names = "default", "sleep";
+        #address-cells = <3>;
+        #size-cells = <0>;
+    };
+...
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
