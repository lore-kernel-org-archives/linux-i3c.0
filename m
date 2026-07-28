Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E57C53219
	for <linux-i3c@archiver.kernel.org>; Tue, 28 Jul 2026 10:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oDO4FkEciw8cKA6rPpYTOCttULfV3AEiIEmuJgu26nY=; b=QQyqIWwQNGUyOy
	LaZuothBeBc2/c8t+eKCK2jV2aX4KPpHcH95+LSVhtemdSaWwvp6qeHYNmghXQqbCOCzJmu8IW+Df
	aVW5U0BqUpq3BiUgniEPFELrDfKxstcOwHBJJ1RnxES38qXeRyp+uzV2rnKLofGMLrQIIddS/SVy2
	A2Vk/ozUDI5wZYOnx0sdbSRgk3uxIGhUKp3/1ZYnosLZa4Xu0toZwmk0d8zrwZ+3FfpG56joavkAX
	dsfFzSVeinIhe2M4i/Mp9qKqX+pnxuZl86LRQxYIicCXEjV/W2FZw3YI5BCBQBQ1Fc4bxip6FXm0I
	qTqF6G6rceJRq0kQf+fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wof2T-00000004xoR-41A9;
	Tue, 28 Jul 2026 10:27:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wof2R-00000004xnx-0l0l
	for linux-i3c@lists.infradead.org;
	Tue, 28 Jul 2026 10:27:56 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82La92359337
	for <linux-i3c@lists.infradead.org>; Tue, 28 Jul 2026 10:27:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KleGeYc/s77Xun7ZdkDiAPcyMV9ltHnmw51PhQU7z3M=; b=ZpspQz/LZJZVFEAI
	ePEDC0vlftVl9JNRocuCSiKbYnLSLW4qQ+vxM+XkYAcsUhMBYMHLDMBynzuEQB3i
	WogoFm/Wf11Rsws4mUjxf/GEhXrm5qA7iME/nmF2EbVjYrOnRvzmzY9OCPObuucI
	/nUYbN3tglL6WTb4WPStgfX6Uu93iTPWgxnY2VE19m9tg7RMK+5Q7kFWmk+Or+1f
	FC8zQhzhUyqXgde7ygwEfwSHC6fSnv7br4OKPTdcHm0ToVNRP7VxVV6xTJT2iVGO
	bEDUtVutDZF2CDtV8zCRNEEfDQ+IIERdeMV+tazXKfpgzsbFdNXb2RsDaV1cvZkL
	1jCBxQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpn3y1f2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i3c@lists.infradead.org>; Tue, 28 Jul 2026 10:27:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfca8558d2so11844445ad.2
        for <linux-i3c@lists.infradead.org>; Tue, 28 Jul 2026 03:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785234472; x=1785839272; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KleGeYc/s77Xun7ZdkDiAPcyMV9ltHnmw51PhQU7z3M=;
        b=Dr3LOeM30p6308qf3fgywIaKzgXLvV+Jubzmwgr9nOD39rYi5OHhE3DZkWrrAkdqQM
         RGJ0cIYO/0KoAcrDL4eJCrXTYxmcSft/jILJGfx5MdoCob7dnpt+5WUStuc6tKhWHmwX
         sLUlHLbNxoXVXL+9zN9DNb4ZwH2PzZDcaZh7yidUy86dGA7gp59K0MwlIzz1zxjE/MK4
         OHvIYVWcORrtCxxkpL1s7/v85stie/EPKSBOt4mC9mTspYFuy/jgVQsCJOmRdnVXGzMd
         KMtCKYq1Pzpd/YFo9ZVmC3W4lvhnw1FkDYcA78v9TirdwcV39OcAhzrYmbiGBoAnle5Q
         YG7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785234472; x=1785839272;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KleGeYc/s77Xun7ZdkDiAPcyMV9ltHnmw51PhQU7z3M=;
        b=tN8vjzOezOHwCVSuISDL4EoGxE8b/VZZffU8rMlzvz4w7VqC6eVjhWJDHCRs5rIdCd
         RZjEM9UwzStFgboLijyozPPOPcYbemT/aG5YMnoSyXbxXGGS6tYxgzvcm7pGwElVgisu
         f16WCPI9rGemlDukVPBSQJ6ILpz0vpe634PB+x48Z1+FSddS7xSYP499yZdSYCn/hr1e
         FEyvlE9uVSnnzEPUApiVI/nKm+s8+lVAaM9JoOiMt/hcrikR1SUdraI049pey1/8xGPf
         MLX98k4qou58tHr2cGBVx9HL7wrlRNs9Wo58Ynt2QpUkDccRPgBict6O0avyIZdi6pbr
         Cusw==
X-Gm-Message-State: AOJu0YywM/Od6PxMV/nIsrEw9HH1p9NCDQSSpvDNevSLiIHWthniNt8f
	0lom8cYpdWWN7WznzDR2EZ1VAi8SXTgyoUHcfXDnxYYVVWsz7JagLZPWdA7BHG97TpeMQXNg3j+
	s7FrUl9nUqX/py2PyiKqsEMW6JAvKKVfmCc8cytvUmkqveoli+YliuqZAZtcPaxaS4aw3gkT0Zj
	E/
X-Gm-Gg: AR+sD108WfnMAVpvf/BfuT0bKtfzA6i4XdvqJnIwBns6ToZQG5MJCdjsKSC2tqycBgF
	eGF87k+DYu4ATJZ6EYUwF5M1kUnXZ8oX3KSFTR6aVJF4ckWmcUKd9i0qiNhKdWMBIq1qizWRiM6
	tsQO92CxNASZ3dWs2GZBy99+NE6LS3FSOraelIpv38RuiAq9pSUv9km+5OqsIvbTUD07eD4ERrv
	f2ALlnccQGA0ZL9WHvPF/aCY5gmDcN3kJqaMC4JDwRKYujCdyScQTLzad4gWIqbuA1o88Blokor
	mv/3V97tb6D02dRY7mW64WfKYyevQdiMcBaPsqmxvDGEI2zOKNAsV/r2dIeJ3IC0PSK6i8mnI/D
	EUzNtMscH9eFPmmE7rrVnp8piAnaHb2nTOQ==
X-Received: by 2002:a17:903:230f:b0:2cf:83bf:6b05 with SMTP id d9443c01a7336-2d015d7e6d2mr20766195ad.41.1785234472412;
        Tue, 28 Jul 2026 03:27:52 -0700 (PDT)
X-Received: by 2002:a17:903:230f:b0:2cf:83bf:6b05 with SMTP id d9443c01a7336-2d015d7e6d2mr20765855ad.41.1785234471982;
        Tue, 28 Jul 2026 03:27:51 -0700 (PDT)
Received: from [10.217.219.72] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5e26e9sm50744115ad.23.2026.07.28.03.27.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 03:27:51 -0700 (PDT)
Message-ID: <5ac5f386-1b95-4b30-a7e2-c246c9bfad68@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 15:57:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i3c: fix potential NULL dereference in
 send_ccc_cmd_locked
To: Hongling Zeng <zenghongling@kylinos.cn>, alexandre.belloni@bootlin.com,
        Frank.Li@nxp.com, amergnat@baylibre.com, tze.yee.ng@altera.com,
        adrian.ho.yin.ng@altera.com
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
        zhongling0719@126.com
References: <20260728063045.73473-1-zenghongling@kylinos.cn>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260728063045.73473-1-zenghongling@kylinos.cn>
X-Authority-Analysis: v=2.4 cv=fbidDUQF c=1 sm=1 tr=0 ts=6a688429 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=8rwow83gy2NtHbje-wsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA5MSBTYWx0ZWRfXwmT1QxtTzOvu
 kqOl9JsxHcJ6RxNmOeYvOSujiX8dxCm7zNfs/vB0U73pFguLz8ZFbz954GVSJXnhroEbuCYaXxg
 G3bxifCUlzjzAKOqJWTFjrCl9zETC5g=
X-Proofpoint-ORIG-GUID: uQVADxlaseqeR5PV42NrVXq9kRndP6Ur
X-Proofpoint-GUID: uQVADxlaseqeR5PV42NrVXq9kRndP6Ur
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA5MSBTYWx0ZWRfXwLhRruMKovhH
 jbYGaAkfZ69FZqGtY4HSSZOztnG821KeP6lSpHb3SjFp4pInIggLPaXS3n0Z6gWbjhboSV/DDzL
 WDO2Y8kyaDngaubINj/zwHkoq3OMyyoPwKPBhN8tbWwvugICyQjBHFFHF7x4uI6EaaVEoiZJ+IW
 8SSsCcoxjk9iT7SUOdC63+ujIYxy1Lz8uiSePrkIjQT4KvdWNewqShahBRWf7wkncy1bFo4ueXi
 pxecVpSGp9LxsflY4l4zdOTldbeIIXv5T4tTU1wUQ0qgW427xWV1+raPasTGo94HOGrrY3cRgqz
 L6M2TbFAS/uZgRCEkAOrAaolADoaMcw0AT8OQ/wGnxTqo8Q87wtRGo4L78Ja2uwQVBOZslZRN+L
 AsjbcgKJuaSnDOIFYzGBgdoQsKedfMSAgu/xlGfCiM29Cxv4WKV/BFZAMD8gp9E1H/RPLyfJfMQ
 VP1NHXn8PdfsRhJG+3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_032755_338726_31474B8A 
X-CRM114-Status: GOOD (  18.68  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org



On 7/28/2026 12:00 PM, Hongling Zeng wrote:
> The retry loop added in commit 02cc832191dd ("i3c: master: Validate GET
>   CCC payload length and retry Direct GET once") resets payload actual_len
> before each attempt. However, cmd->dests is only validated for DIRECT
> CCC commands (I3C_CCC_DIRECT bit set). For broadcast commands, dests
> can be NULL while ndests > 0, causing a NULL pointer dereference at
> cmd->dests[i].payload.actual_len.
> 
> Fix by restricting the actual_len reset to DIRECT commands.
> 
> Fixes: 02cc832191dd ("i3c: master: Validate GET CCC payload length and retry Direct GET once")
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
> ---
>   drivers/i3c/master.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index fd3e79d10c84..21212c34c31e 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1051,7 +1051,7 @@ static int i3c_master_send_ccc_cmd_locked(struct i3c_master_controller *master,
>   	for (attempt = 0; attempt < max_attempts; attempt++) {
>   		unsigned int i;
>   
> -		if (cmd->rnw)
> +		if (cmd->rnw && (cmd->id & I3C_CCC_DIRECT))

Please review this recent fix @
https://lore.kernel.org/all/amJau9LgehYLnR20@lizhi-Precision-Tower-5810/

>   			for (i = 0; i < cmd->ndests; i++)
>   				cmd->dests[i].payload.actual_len = 0;
>   


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
