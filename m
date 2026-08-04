Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BDE3C55822
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Aug 2026 18:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EV1vn1EqtoUt+cPShv6upf1QSCLjXhcS59fHz5b8IhY=; b=0aQ/Z64VNYXnrS
	ItgkJbj7yQR2sfyt9g004cN8zvAcAkb1n3bBm4jI6eO30uG8D/kx9qC2jBqKlokgYQGItRZM6aOfA
	vK1WYBA8/kN15UmucGO9UvS1xJaADYYnfhn9GGxw4/kFMMZethZvtcU+X7OXbECLVUInzBxsZGU0f
	Hd+51vwRDuDBYojwt39bYKogAUmnZ1441YFVzS0h8fyRglEA1lthWlLMG0+lNR/s09nr8o2rQRiKm
	ppF8hgqXq/vztiE+vise0/T5x6fU3p2PeDfQvf0nvUQ0vG6m3ZZvIZlQL5iHJrkuX6GfAyvOII//6
	n/AabszDOhfxmFhbGTrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJcn-00000002aKi-0jsZ;
	Tue, 04 Aug 2026 18:12:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJcl-00000002aIx-05up
	for linux-i3c@lists.infradead.org;
	Tue, 04 Aug 2026 18:12:24 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674H0FjL580085
	for <linux-i3c@lists.infradead.org>; Tue, 4 Aug 2026 18:12:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ASyHTNEVNi5r18fBCeervNjdQdHm+MvkAMt4iPH0kVo=; b=hPKdfl2Kzb0PMnWL
	wyJfm/ZTqLS6zb6najKVX6yGOjgKyPcdo45pD3b1SeTjF5K5u3BG1jC8DifV/4Da
	vXJCDtyAcaIsrw8hx7JLXQrn/Oz2cS+5thCdWTkAaDOoGKfJPvduQJa7MucvDJGU
	vVhODXcHwRSASU5Dhac4mkYQkO7udgkE2f26FEsmYRLxvS3jZhrr/V/RP2E3knnG
	2ECZpJm54y3AL3a2v1L3+Xl5Tt6wZeqpQrpDppned1mHKk+l4h+UsIFDk6ft3v5w
	kO6FS4900XVSwB977dTh5UWS1XnzeM39wVB4C6uuIul9GMlJSlKF/O+FktxZvKq7
	nho9FA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum3q8b8a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i3c@lists.infradead.org>; Tue, 04 Aug 2026 18:12:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e22137fb3so140186a91.0
        for <linux-i3c@lists.infradead.org>; Tue, 04 Aug 2026 11:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785867130; x=1786471930; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ASyHTNEVNi5r18fBCeervNjdQdHm+MvkAMt4iPH0kVo=;
        b=Lnz+7Iv4k/zAac6owatESZwiCNu0niZ2q8tyrvSVv1BxbJhFQ7Cm8/nNOr3XGhzBzn
         4gkFIQRwyBbQXIQlmu3cC61eX3EIRxQ8DOBxQd3QBE8RxVHuT0QMV2Hb4lqowNy/WcHd
         1zlK71usNz/nUzzI1mk8/b3ZiyHhDlaaz/Sb1F/7e1OSvNI8LDhf9tKk1idGp3OomriZ
         DfYBbfhbh2f7HBKN1m8opY6rjowRTTdvZdCzTFJEAG8r0+LOhMCCMar6uN6Kph5/lVoy
         TD3sAIbjBdaeRbKcwGCj0htKt+HaWZm/yErKyK8yCL53c3B1IwLBmw6UOhJPRXTBIOfL
         3Jwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785867130; x=1786471930;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ASyHTNEVNi5r18fBCeervNjdQdHm+MvkAMt4iPH0kVo=;
        b=nDZxGYeABXfXte0KTS07qJnZ2oUgjDfq52VtI9T6Om9MZ7gpZtn9PunM4L6eGgOZHd
         su+E9W7l66Gt2zaB6QHkJ0SAplPnRBQFsWKA/cV6G0d9hDNuwGksjv69zjTesm6aM7+3
         NhVLJwOFwl/bGLg2DIEKWFz/z5ZEJ7Msacf9nSRV5WdOeMIMVDQ4TlJP2z86NKrVX8Ux
         Kdc9++rsbi11jj9ADZSliUj0VEEjy/E1AmohISW5IxHu6kmv1QAaP//DpsbNsotYl0q2
         NjKYGLzOCtiX4fOwm+rstMz6AE9E6vs2A5/1yabnKWkxkS+NOXL/JIi1F0AtMGIB4u+B
         5Tzw==
X-Forwarded-Encrypted: i=1; AHgh+RokjXoOOWP+jqoFdRZzbD6bDYRl5ykkh4X+zU245S3HE2v96bfSFyqCM1zkKCnE3Gtq9k8WfKREh8M=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6Y87YXGauJlW7JcUKlt7kZng1bc6FAL28MCV/+8dSgYEuPlL2
	NwqgMFOaCrQDRBH0j5eiBTcoMQ6aliI3YkseXOJQGMAUPqfXdutKfxRYB1+TnTxCgUSnvaR6cqg
	6L3qwn4jy5SkqX4+YeX9q5g8Z+qrovYWTkjHyL0caMwwAChekp+ut7a7/4alxOuTpvaKn
X-Gm-Gg: AR+sD11hFjJwL2/nViaPNs6c60UoPAQMNU7WK4dmYj1XihsDwwaZLKG4qRGIdKT21Kr
	mMFnwyHkUm6kjhullpwadJSYCqM19uw5H1WR5/CYzBm/7U0Eu5iUexNVB1ecpT0cX1d72kDBiuB
	kbatrz38ep7OCsFNBHc+x6Rubetjf8j5SJM3hY9po7l3g6Y/ghD42tWh6VjUdsDVh7YCzz56lNE
	KuttIzKvQa/wbrqjwEHsn//6XRjoWWh2tQhYuV0vDTc5vZ53xUX8eb1mDkPXMdB31E+OVM7fA+4
	z2176HId8v4y0tZTVOBMa4J4v9gFfquc9BUXJ9YQ60woCIwGsw4QfD2CuvSrsNtT0/fhD1f7yli
	44edTYETDyVmjQHSJ2IlabsdFrFbgV1Tq1Q==
X-Received: by 2002:a17:90b:4983:b0:37f:9ce3:ca95 with SMTP id 98e67ed59e1d1-3903c6e051amr654641a91.30.1785867130274;
        Tue, 04 Aug 2026 11:12:10 -0700 (PDT)
X-Received: by 2002:a17:90b:4983:b0:37f:9ce3:ca95 with SMTP id 98e67ed59e1d1-3903c6e051amr654595a91.30.1785867129813;
        Tue, 04 Aug 2026 11:12:09 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.234.41])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca2e8ae2sm5560935c88.0.2026.08.04.11.12.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 11:12:09 -0700 (PDT)
Message-ID: <0d5dd29e-ced0-4c3f-a507-ebcd52f919da@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 23:42:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 06/14] i3c: master: Fix potential UAF in
 i3c_device_uevent()
To: Adrian Hunter <adrian.hunter@intel.com>, alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com, akhilrajeev@nvidia.com, rafael@kernel.org,
        linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260804133810.184905-1-adrian.hunter@intel.com>
 <20260804133810.184905-7-adrian.hunter@intel.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260804133810.184905-7-adrian.hunter@intel.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE0NyBTYWx0ZWRfX5t9r7thRTQDR
 PmEg0WvQcjAlFaZjsUN9Av2hNy9kmx/NvzF2CqCpp7qwqOM1ANBq0/+LYMxC28lb+lbEV1vDQ+6
 61dCz4j79KmW2OeJls5KD6tGE8CYyU+e78Shofeqk0pbvQuFLQQBnFksCAkUyUULk0AyxuLkw/G
 JT4AJZRt0C430Yuaixz/fUmRIfDWqrAwhAojub0WRx6hRxlGRJcv+Ed9dE0ausT7fvMxauro0Ar
 tL+atpIacj55JHBC3WYTgU5t1+DhIpPnHzGeUTpyVgcXe57Y+Yk0QKudli6YFVUvw9zDPqTyGyN
 2mMmk3RIJrOe70WHhXAczhE6bAr0EImwgR+BpZm3hoAMPy7WDtkvCbJbmNTiqMqAar0L8T3i1ln
 2cNai9s6dBLMV0vvltICl9Z6tkrvYChw5k6QB6EoZls3sy6nA5Ev3AevR9EAq/q8dbxjqyaOG2v
 ugiNDt/Rjul/K4ntERA==
X-Proofpoint-GUID: m7yYRRc_ZW815SqWX3AjqqvSUOz471TA
X-Authority-Analysis: v=2.4 cv=LsiiDHdc c=1 sm=1 tr=0 ts=6a722b80 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=/lQgZcjXNA7ZrIsIl4Cfeg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=ohCnSGWktmBL-HYrFGoA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: m7yYRRc_ZW815SqWX3AjqqvSUOz471TA
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE0NyBTYWx0ZWRfX52qsS/PSuROm
 XXzTC+nT83YCqKLR+Cq7gHjCbKXxpSZJ9r8xveGwL1EF81+EFMutP1wFz2EOQJINmvSYPb+uois
 LT0uEusHLjGQCBS6GfzcLHnlPgJogY0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_111223_183761_97341231 
X-CRM114-Status: GOOD (  18.03  )
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



On 8/4/2026 7:08 PM, Adrian Hunter wrote:
> i3c_device_uevent() dereferences i3cdev->desc without holding the bus
> normal-use lock.  Since the descriptor pointer can be replaced
> concurrently, including when a uevent is generated from sysfs, this can
> result in dereferencing a stale descriptor and lead to a use-after-free.
> 
> Use i3c_device_get_info() instead, which protects access to the
> descriptor with the normal-use lock.
> 
> Commit 6cf7b65f7029 ("i3c: Use i3cdev->desc->info instead of calling
> i3c_device_get_info() to avoid deadlock") replaced the accessor with a
> direct descriptor dereference because i3c_device_get_info() would
> recursively acquire bus->lock during device registration.
> 
> This change depends on "i3c: master: Fix recursive locking during device
> registration", which moves device registration out from under bus->lock
> and removes the possibility of that deadlock.  Without that change,
> restoring the i3c_device_get_info() call would reintroduce the deadlock.
> 
> Fixes: 6cf7b65f7029 ("i3c: Use i3cdev->desc->info instead of calling i3c_device_get_info() to avoid deadlock")
> Cc: stable@vger.kernel.org # requires "i3c: master: Fix recursive locking during device registration"
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
> 
> 
> Changes in V3:
> 
> 	New patch
> 
> 
>   drivers/i3c/master.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c

Acked-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
