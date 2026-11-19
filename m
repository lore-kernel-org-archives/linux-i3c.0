Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C02606A32A
	for <linux-i3c@archiver.kernel.org>; Thu, 19 Nov 2026 07:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VxznsCsK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oODRBWzo;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NrDM1GBz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OyQfcCV7v0WeoZ9xR/WULiZZ6HWTJVP9Lj5Frl+a7UE=; b=VxznsCsKhV+AkZ0nJIg2J9M03o
	JIrANITFzt/XNFTJPk71me1+tjots9cRpQakiQmg4q/IkveDzDen3ZsqRyAlRG18HpOyrXrdg0+La
	mw+t727THoeOPJbWsulX6ajJb0o+uHHcKv171b/C+j6exyNxrvbIMg3chYR4/Uf3EBWhWomiDBKS1
	YMiuArHb0JoP1Vb/Im4yzNxOFT4HdMnWq8ajU8Ys8wF83BwaO90mDy0+GeM9ggXYYhDJ7sXTBD5jR
	GahGqBTSZ5nzZEvj6NZUv817kX6GPPmpbSxRSuev4ErQo3tPuI05sgumKnpVdjtTqg9sM6TwBwWSC
	JwwvHdrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTwIu-0000000B2h8-3EAY;
	Thu, 19 Nov 2026 07:11:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTwIr-0000000B2fi-2ijF
	for linux-i3c@lists.infradead.org;
	Thu, 19 Nov 2026 07:11:31 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ7088R3635530
	for <linux-i3c@lists.infradead.org>; Thu, 19 Nov 2026 07:11:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DdDcVD4zeEPNRO+BwyCwbOJ/2pD/TbB/A2AoOr6cETg=; b=oODRBWzo0WVLn/yz
	r/qqs4ew38c5s8Y2C9jWsI/MdgQ3doWeU4tpKM668Y59KVFjh5Ojy6BtYFMQx//Q
	c9O4rATzmpDthO9TmKuVez34+oEA7Nuu6SO3oJegQR8SukJbaO4NM0+ydcUpkxsj
	N7nhUFgdy1EvlApUY33U4k2hIVcTe/nwLO6gcnAIaiUOdcSg0qhmQP3xn/WImpid
	8Wfm6YaIiwoXMAuz4498k8qqJioS/+7JPdSnhH9tiZIhS26sP18VTwlc4xOFTxpq
	djd0eDo+5vMcTIC1oXcR0ck8bKKnPHKnc45xLa4LK10eS/pxzLtp36m8LTcYahTa
	Q8M+1g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1dnruxuu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i3c@lists.infradead.org>; Thu, 19 Nov 2026 07:11:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2edd25534afso15647805ad.2
        for <linux-i3c@lists.infradead.org>; Wed, 18 Nov 2026 23:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795072286; x=1795677086; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DdDcVD4zeEPNRO+BwyCwbOJ/2pD/TbB/A2AoOr6cETg=;
        b=NrDM1GBzj0eZzQ99GkZLTfijW2I9W9GXUY+KMRo3dPIsp20r8S31iO//A8OGpNyN7/
         MZWFLV31xF9Z01Hfl+a+VtsZnXizKw6NIEpM5KHtmx8c6NzoF4otoZDe2r5G2QxCqybR
         BpxJUTPF80y6gR7rCvxlc30Bk9+NyK+xVH90hBgUJ3mZ+DTRrjFdROmdILKsdh/ow6Mg
         mULBci0GtEhgTdSvd5SBTt519SHIBF2VIRizEpmAtzfIDtJyMEtMtxF9pih2o1JJ+1tq
         6izoYJROEmclJgEBKSQgKbklTMp5Lx49sO21qDNhGagQ2PWeyDT77GpneQkn+ZvVte+3
         vDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795072286; x=1795677086;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DdDcVD4zeEPNRO+BwyCwbOJ/2pD/TbB/A2AoOr6cETg=;
        b=F66eW2NxoGIoblAMYFC2SJf7ienVbuqco7WrVXDIHjH3LAegmtBunZDAvDpySJkdLh
         l6VlFngJsvc+YLAPCSWc8eSCw52pAI0DjCUABEkSfKdGTuNyquY9SjNJ35fUV120D3kU
         r3A5Xaq4kASSuLjdh58PSHlICBbtiE6C3xNv1OeDrMMeIpnqEM9yCJ3TjLDnOJh4a21E
         19NVnijD9kZ9+Ym0G3kI70SoZViDgaWBYR7ONcdBOVKcUxe1ldcHhijLGO3YZXy13Bmr
         1ppRmZ4T65FvAUODHC2zekiHf2MtYS1f5Nuz3AlI29sJxEbH1D5yuUHeaWx+/IdPGOCd
         oTBw==
X-Gm-Message-State: APuU4Z/IfKmWoVrQ5pOQw8UeL0J9IcV8LadYKdfxpF+wCJ12dbVnuOa3
	opEtxVjTICLU7cXtEyOUDrnxz3QplyBYoknEv27rfXfgZrKiXBKhv2nQ6SPE5JqFpsHRY82Ki8q
	YTlHNC8WEg6nieV5C09mghtMYBUpaEokxl8AU+5V+NwGrjafIrgeF0EpOTrJx4IvdtOGp
X-Gm-Gg: AZFdTZewLb84Je7uQ3Rt1Q3Zr21r9ahapCj/SBinguRyZH5M1AYqYXiqdmNUljS3Sd+
	5Hi3VzaISr5670JG75IZLyoAToaoHi3pv8ZO9q5BRmXY7vo5I7va0TjmO9ayjSj37Vxx80nqf4X
	j/OaEr/zev8S1HPUaouG/pkQ3nxK8jdobTFbjwfyPOeCipdm1Q01/w91X2IZyh6PFjGHXExWrCs
	VBaFDA084qbnuoPUWnil7favzAdmLWTTe63hTCLaDi3G3yCh2ljorFvBSCUkwtIP+tqJnm0nnHr
	VO99Pj2nW54zX4VYWGPIrfaded2rUMXp54D82Q88CEjiTMqXSF+5XGEbpICbVR2mkPvcZwKcZfh
	JM9RM9flf0ITjJ3BIQrjQZRs+j8CiIdrvrfOQUeXGgl4IVNj50GyJtCkKe8nvJhYATCle68Uu+R
	5aPNzCtZE=
X-Received: by 2002:a17:90b:4acb:b0:3b3:8094:321d with SMTP id 98e67ed59e1d1-3b3d07aa6e9mr4435703a91.32.1795072286349;
        Wed, 18 Nov 2026 23:11:26 -0800 (PST)
X-Received: by 2002:a17:90b:4acb:b0:3b3:8094:321d with SMTP id 98e67ed59e1d1-3b3d07aa6e9mr4435659a91.32.1795072285666;
        Wed, 18 Nov 2026 23:11:25 -0800 (PST)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4057af4e2sm1243414a91.7.2026.11.18.23.11.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 23:11:25 -0800 (PST)
Message-ID: <553b354c-70f1-4b3f-955c-17a197e6ad20@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 12:41:20 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i3c: master: Disable slave events before RSTDAA
To: Defa Li <defa.li@mediatek.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li <Frank.Li@nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
        mingchang.jia@mediatek.com, yuhan.wei@mediatek.com,
        hao.lin@mediatek.com
References: <20261106062236.564607-1-defa.li@mediatek.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261106062236.564607-1-defa.li@mediatek.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAyOCBTYWx0ZWRfXz2SnM405y8cD
 j/bL0a8iHJSyLajKVJsSHwiLEr95IiQGX3P9yrmOuPc/i4tFyKnoRhYSoTlz1qtApxIkDToktxU
 He002nvdN9RXJLZYhHsoe0DtzHpJiU/7EnPsvOF4afQX6rAOldx4+ni1CPmzZDZMpdrr847JDd6
 ywqi/xSMZZE60m/R4sXoqkhom4CYbd582MuBkzfJsppWIaPkIqI/cdzteHasiqVPs/8wPWu4etm
 jQUwVY1YGS/7VUY26nrFKKeJhboAEVPK7mq9VbdTkasM99o23EgkVYxb9Ve0RHdmPFr6okyOh/G
 di+9a0x4KgP51t/u87WLnU8FiYTz6S3VWFGwilVQQgqg74TMN3buCKnLsDjFMORdPJSOozDO+YG
 JysB6Zl0eNcfKTTQ33EOo3otnt5jc793Qwi9XUBfxmNed5mZuDfZy5UwA67FjM42KA8WCRKuJfS
 Tk7oe37O5CfiM60IPXA==
X-Proofpoint-GUID: VfIHciOl2Kt_tO0uwhWhQ6F6lJDe8H8T
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAyOCBTYWx0ZWRfXxWRj94NEwqs7
 5EPpnudphzgK3S8yIouBvvYrtl6jrVN2e/OH/zGVt/cGklktBrxEnBn6Yi+qmq1wx/4d8TQaHPx
 8SAvuc5j/h0BuGu//gIM5cAE8nl+U9k=
X-Proofpoint-ORIG-GUID: VfIHciOl2Kt_tO0uwhWhQ6F6lJDe8H8T
X-Authority-Analysis: v=2.4 cv=bfH+w+PB c=1 sm=1 tr=0 ts=6afea11f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=mpaa-ttXAAAA:8 a=qpz-AGu6-bpAACMkIr4A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_231129_796204_8B049E26 
X-CRM114-Status: GOOD (  20.14  )
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



On 11/6/2026 11:52 AM, Defa Li wrote:
> Bus initialization sends RSTDAA before disabling slave events. A hot-join
> or other slave event may occur after RSTDAA and interfere with the
> following DISEC command or the remaining initialization.
> 
> Send broadcast DISEC before RSTDAA to disable SIR, master request, and
> hot-join events before resetting dynamic addresses. This prevents slave
> events from disrupting bus initialization.
> 

While the sequence you suggested making sense to me, but i am wondering 
before bus_init, are there really a target device getting powered up who 
can generate hotjoin ?

MY understanding is, post master registration and bus_init only target 
devices should start life, isn't it ?


> Signed-off-by: Defa Li <defa.li@mediatek.com>
> ---
>   drivers/i3c/master.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 01e05bad8661..4fdc8f721364 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -2571,10 +2571,12 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
>   	}
>   
>   	/*
> -	 * Reset all dynamic address that may have been assigned before
> -	 * (assigned by the bootloader for example).
> +	 * Disable all slave events before starting DAA. When no active device
> +	 * is on the bus, returns Mx error code M2, this error is ignored.
>   	 */
> -	ret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
> +	ret = i3c_master_enec_disec_locked(master, I3C_BROADCAST_ADDR, false,
> +					   I3C_CCC_EVENT_SIR | I3C_CCC_EVENT_MR |
> +					   I3C_CCC_EVENT_HJ, true);
>   	if (ret)
>   		goto err_bus_cleanup;
>   
> @@ -2585,12 +2587,10 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
>   	}
>   
>   	/*
> -	 * Disable all slave events before starting DAA. When no active device
> -	 * is on the bus, returns Mx error code M2, this error is ignored.
> +	 * Reset all dynamic address that may have been assigned before
> +	 * (assigned by the bootloader for example).
>   	 */
> -	ret = i3c_master_enec_disec_locked(master, I3C_BROADCAST_ADDR, false,
> -					   I3C_CCC_EVENT_SIR | I3C_CCC_EVENT_MR |
> -					   I3C_CCC_EVENT_HJ, true);
> +	ret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
>   	if (ret)
>   		goto err_bus_cleanup;
>   


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
