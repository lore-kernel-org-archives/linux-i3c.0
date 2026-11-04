Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DD8606A31B
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Nov 2026 12:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b4G89bm9;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dK6LpR7A;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z9Js7Zo4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Xvo586y+cYgMt66ZnaJNRSrrP9qMgHQu8VKV4uZ4DrE=; b=b4G89bm9faxUebMV9yAiYvO4pl
	TafHZaCrM67s6cI5Uopg1/yEjQLYilGUl/XlZuoSLyjEQ9hufwV4WcJv5f/S6TNeaiEl6Wyyafv0a
	UZxtdFqSB90fl3ZnxZ6JlxPNyK5blt8O3IcPyLuSHNuybkrNu0d2MSmImFp6orXwmYwSOJTSQu2Yh
	D38Dail/BS3kdxSLnnc3RzngZakqPOWSiYvvHJ961PhMlwlnbIsbMZybA5wOjp8CmBVKHF5EROce8
	UsoLUGYoBFgzZMF8B7IPUsKZzwZvT1B+yDGkj/BL7tPgDaEpj08xkJw7RkvezIJyK1IOpno1TiWVs
	jxd6u+ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOa9d-00000005Kyi-0Pb9;
	Wed, 04 Nov 2026 12:31:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOa9a-00000005Kx1-1gpA
	for linux-i3c@lists.infradead.org;
	Wed, 04 Nov 2026 12:31:47 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZvNL739262
	for <linux-i3c@lists.infradead.org>; Wed, 4 Nov 2026 12:31:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lnL7P2K2JsAHzjwZvLRLUkgDyRdrFe09a3PwUwJXSRk=; b=dK6LpR7AFtsbeFf+
	pRbP3a65/RSfyMrV7sEWkjXVmlyFSwPYC3KG61yqkxRWGe871n3QNtt4jAOEdm2T
	CXtt+2SIY1vwaaYMbQAPvvjvTr6e9zY/YeHdRCXN27ZcPrpJhMnOf8A44HCejBk8
	3tbtA1fjqf9k87+UK4Q0Ty4EuCpXMXjXBwfsJTXH7ct9UAG/MvSe6k9yQxzXx3IA
	cRfseUmvUX9GDl/YwY18g5vBhg7SfpdEshtczwPJVbeoumu4fV5MBLKrtsXNjzvh
	5AvgtXvGIG1vPv60vCx2+t3LHNbx3mavUBsWXaw5bxprY0iRr1I7cg7PWPvfUBXp
	wZpGxw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr163h00g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i3c@lists.infradead.org>; Wed, 04 Nov 2026 12:31:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2eac6e96bd4so10726725ad.2
        for <linux-i3c@lists.infradead.org>; Wed, 04 Nov 2026 04:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793795485; x=1794400285; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lnL7P2K2JsAHzjwZvLRLUkgDyRdrFe09a3PwUwJXSRk=;
        b=Z9Js7Zo4xuoYaj6E3npIxZ0s8stb0ovRHQbNjKRSqRp72iAC7b9vC4qS4xukwdhn/g
         UJRhuMbQYJQPwdnrhRC3hW3Amz1QUdj6u4tS3RmApYwRAFZ+N5aJ8+zajSUnA0jLb47Z
         Z+N7I7xMt4S6WnkevuHrdH70cb7rAo6QsQEEttSPEmE9H014p6/Hr0PIGoEZ+xwfEoDI
         eQI56uvpxKlYbDBzMSUH8btLMVAwi+7X4UZVDLwWXe10DJszv7Wsd82+XxEaV8E9+RaY
         xMEfets/bIBV8Um10INN3bQJrTq9TZh2IWbeF0ndp09Fl6H18fgRBBTw4W0+g0W5COO0
         616Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795485; x=1794400285;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lnL7P2K2JsAHzjwZvLRLUkgDyRdrFe09a3PwUwJXSRk=;
        b=pRehIPioR2V714VU2d2DKbXipxZ4o4LJGUjDYXK3pQwjEqJbx9Sqa+VaAzJNG6ndnD
         /6IkfgySTsMiYhY5rd0Nb+aqnB132q6X0mZV5udX1tcrc8iaUU9/BwESjemcNDL96s/0
         YEfJOz551zJ/m9BaVdebKM9HxO/u5HUUfPTXpJWqCyywiBdG9abW0qumiz3pVzDKIj76
         YrnhXjqMmdbk5jgJIaDhIzGefCL2ZicRFI17zqJOYmn+amgH7eFwli4zd6Q9ycfNOHJh
         XQoeoQOXPp93TJVoV86oV1reiAH1EGK4vO1Mj02yTSLmxH3dSbseyUdEq68l+98t/TOI
         NXbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkyvm6uIi35juqvLTOcya1qwN3kcryaFHRlB2Jwl/vc7nxjjZsePNexWIDS+bBRZ+ny6WPOkKFV5U=@lists.infradead.org
X-Gm-Message-State: APuU4Z8YxGPFI7hTezx44/DBQZy8LtaEGLqsGHHu9ZszNFCc9tyWop0g
	meTSpVAyumxe5nWJ7L4exQK/hgGlM4w3KAYrvoJx87TyVH0ZMGnWYhNxb1GdrG+AWB749j7yVPu
	CVGJMfxwxa69bLkUJGDz0bXSZWCQ8VzNN9wCeSiddAceaMZS1RxPF+Ko2l2AfSd3R5tcm
X-Gm-Gg: AYBFou1r/JYaCPum/xVTJe3h2VZuHvyUQMvZoqlRzeh4Ch3j3c9MBmNlkKgSpzR8LZq
	7cq9zyCmjbx8ufuOesdegxZVeAzuVEcaJMtmfIIUxzF3qMq26cGR3pvsmIQDCOeivDE21uj8oL9
	vOeWqW8n8K8pjzbjPdL4xXY8lJFXwnnWONjL/gbQd/P13XmltOdRC34PIxfpd0PxE0yRnha1LIC
	a/glGaj7oYT1XKrd6Utf5pSO70WBW4DinstHlduyHTIz+cv/Vqq1U20tGO2FEi/7JKsWax7RVMf
	V03cx9Vb4Oz3o5YBEAkaKb9rL/VtRMijPJZb2OB0DLWKK5jp7n4Q1OPCWPQ/4vc2b7BiJVnKN6+
	15u9HgH/g0b17AZ7OX29tawPErMhgw8J63mazEVfSQ+fWJ9cQh8cBlyw/R7CIsD+kAuUL+sMRPD
	ZYunD5
X-Received: by 2002:a17:90b:28c5:b0:3ad:ce24:acfa with SMTP id 98e67ed59e1d1-3ae897c652dmr12667817a91.20.1793795484699;
        Wed, 04 Nov 2026 04:31:24 -0800 (PST)
X-Received: by 2002:a17:90b:28c5:b0:3ad:ce24:acfa with SMTP id 98e67ed59e1d1-3ae897c652dmr12667780a91.20.1793795484065;
        Wed, 04 Nov 2026 04:31:24 -0800 (PST)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c2ab1cdsm9423184a91.0.2026.11.04.04.31.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 04:31:23 -0800 (PST)
Message-ID: <d40f2212-754d-4788-a555-6a58c2479bed@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 18:01:15 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] dt-bindings: i3c: Add support for Qualcomm I3C
 controller
To: alexandre.belloni@bootlin.com, Frank.Li@nxp.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, shubhrajyoti.datta@amd.com,
        shubhamsanjay.patil@amd.com, adrian.hunter@intel.com,
        manikanta.guntupalli@amd.com, linux-i3c@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko.nikula@linux.intel.com,
        wsa+renesas@sang-engineering.com, alok.a.tiwari@oracle.com
Cc: konrad.dybcio@oss.qualcomm.com, andersson@kernel.org,
        jyothi.seerapu@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com,
        aniket.randive@oss.qualcomm.com, praveen.talari@oss.qualcomm.com
References: <20261104111610.3739095-1-mukesh.savaliya@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261104111610.3739095-1-mukesh.savaliya@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: pfedwjvGokEvofkp3w_BJccYSrFaQhYL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfXwscDl0+Ipbtq
 TM5jLuG2Bl2mCgo+Y/cyGyjz/wxOJg+1mP+zWU8SjWO7Px41vaNLCMVQkrDMxf2tJvFCzxhMp9o
 pxRD/PG3qAdP/rMu9JQbAhrdNFoszSM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfX+L3yG3xH7Azz
 ZbG28ML18KQ0TtOQaxpPRJUvgmP4C6rsjxMKRb5weIv11a6kV5zfNlsD4okCwI6HTII1Tx8D8lA
 gsjTOg+z637uXae2V1AtfUDk3CzSMALuH/ZiqStXv13GjkFLsS+KGW48OKC6xO5sy/2czPdnGpt
 rq4pI/Ssv97J3I30Z6ObCzPHkHrojINoAebsdgWFRBUxS8zrY/o4f7WAfTtuZhbKc11ZyAXNR3N
 lMo4hsxZvjiZupImdphIUiqvCEPGgNPOhUCkEtNIboT0F74Sl2qRht/Wilw7fgp7iBQlfthN/Dp
 O9oBQiqe7WyQAu1zg6PJgQ6MY4q1zXL25sS0R+Cth4pk0u1+ja9Xj63DvCMsrgVHKoEn6cPD4dN
 ckquG4daMqltLVsWzcXa/dTg6Tt9HD/2ytIoW0z+51uoXcNLQyNUeD36XhwAps1jikvCwXnkpZ1
 ot6/NLBGPjiA7Nyhvew==
X-Proofpoint-GUID: pfedwjvGokEvofkp3w_BJccYSrFaQhYL
X-Authority-Analysis: v=2.4 cv=O5OsLx9W c=1 sm=1 tr=0 ts=6aeb259d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=rw-enEzn-TZYpfUHzgEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_043146_462512_6B7F2F2A 
X-CRM114-Status: GOOD (  21.33  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Apologies for the additional email. I missed including the cover letter 
with this series.

Please ignore this series without the cover letter. I have resent the 
complete series with the cover letter included.

Sorry for the inconvenience.

On 11/4/2026 4:46 PM, Mukesh Kumar Savaliya wrote:
> Add device tree bindings for the Qualcomm GENI-based I3C controller.
> 
> The controller supports I3C SDR transfers in mixed-bus mode with both I2C
> and I3C target devices present on the same bus. The binding describes the
> I3C controller instance along with its associated In-Band Interrupt (IBI)
> controller used for handling I3C target IBI events.
> 
> Document the required resources, interrupts, clocks, and dependencies
> needed to represent the hardware in device tree.
> 
> Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> ---
>   .../bindings/i3c/qcom,geni-i3c.yaml           | 115 ++++++++++++++++++
>   1 file changed, 115 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml b/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
> new file mode 100644
> index 000000000000..bab89aeee23f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i3c/qcom,geni-i3c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Geni based QUP I3C Controller
> +
> +maintainers:
> +  - Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> +
> +description:
> +  Qualcomm GENI-based I3C controller implementing an MIPI I3C bus master.
> +  The controller supports SDR transfers in mixed bus mode with both I2C and
> +  I3C target devices present on the same bus.
> +
> +  The controller consists of a GENI Serial Engine (SE) responsible for I3C
> +  bus transactions and an associated dedicated IBI controller(IBI_C) block
> +  used for Hot-Join, In-Band Interrupt (IBI) handling and management of GPII
> +  resources associated with the I3C controller.
> +
> +  I3C controller nodes must be child nodes of a GENI-based Qualcomm Universal
> +  Peripheral(QUP) wrapper. Refer to the GENI QUP wrapper binding described in
> +  Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml.
> +
> +allOf:
> +  - $ref: i3c.yaml#
> +  - $ref: /schemas/soc/qcom/qcom,se-common-props.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,geni-i3c
> +
> +  reg:
> +    items:
> +      - description: SE (Serial Engine) register address space
> +      - description: IBI controller (IBI_C) register address space
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: se
> +
> +  interrupts:
> +    items:
> +      - description: Core Serial Engine (SE) IRQ
> +      - description: IBI controller (IBI_C) manager IRQ
> +      - description: IBI controller (IBI_C) GPII IRQ
> +
> +  interconnects:
> +    minItems: 2
> +    maxItems: 3
> +
> +  interconnect-names:
> +    minItems: 2
> +    items:
> +      - const: qup-core
> +      - const: qup-config
> +      - const: qup-memory
> +
> +  pinctrl-names:
> +    minItems: 1
> +    items:
> +      - const: default
> +      - const: sleep
> +
> +  dmas:
> +    maxItems: 2
> +
> +  dma-names:
> +    items:
> +      - const: tx
> +      - const: rx
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interconnects
> +  - interconnect-names
> +  - pinctrl-0
> +  - pinctrl-1
> +  - pinctrl-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,sm8550-gcc.h>
> +    #include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
> +
> +    i3c@884000 {
> +        compatible = "qcom,geni-i3c";
> +        reg = <0x00884000 0x4000>,
> +              <0x008c0000 0x10000>;
> +        clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
> +        clock-names = "se";
> +        interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 796 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 797 IRQ_TYPE_LEVEL_HIGH>;
> +        interconnects = <&clk_virt MASTER_QUP_CORE_2 &clk_virt SLAVE_QUP_CORE_2>,
> +                        <&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_2>,
> +                        <&aggre2_noc MASTER_QUP_2 &mc_virt SLAVE_EBI1>;
> +        interconnect-names = "qup-core", "qup-config", "qup-memory";
> +        pinctrl-0 = <&qup_i3c1_data_clk>;
> +        pinctrl-1 = <&qup_i3c1_data_clk_sleep>;
> +        pinctrl-names = "default", "sleep";
> +        #address-cells = <3>;
> +        #size-cells = <0>;
> +    };
> +...


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
