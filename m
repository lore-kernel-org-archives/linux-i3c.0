Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20AD0C55184
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Aug 2026 18:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=327SzOuBwFmf4EnjKKPhXvqFrWNIGfl/srUGNLZVA/Y=; b=JN8RBLbOh4NvAA
	03Xj21uf/rymZAE4ojDAD0czeyYftOhV3lOL4Bbt+m8VdU+xY31fidlNTIkhP8Kx19F80jMwMyOBI
	XHSSHxV39doYIjVPg0CiGmIeTIvjFKTcDoDl98MsmaqM3/m7W/u0zngwWjHpcpCM8Iw0fvx8JGiR2
	olc0LwP3Tbcc5+TUdg2b0a6CLcDY42/wovHX2RjSiEtaBn8fDqYUZ52I0492F7Qzac+BhudocJi+Z
	9ZrYfFEPL7Ba/sROKtP6Vs/e/cg/VkRy+/Ohc0j2dAfHpS+MB+KilPHqoC7WcEG8R/6TNV3w+s14O
	wToL7/JjDx/HPLEs06RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJlW-00000002bgv-3f9o;
	Tue, 04 Aug 2026 18:21:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJlV-00000002bgY-1fNR
	for linux-i3c@lists.infradead.org;
	Tue, 04 Aug 2026 18:21:26 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674FfsH14057736
	for <linux-i3c@lists.infradead.org>; Tue, 4 Aug 2026 18:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4AjFf2wRc96KLV85FfeVqtVQ8LAkWfwTKk1LL7rV1DE=; b=R5bg7HYcPz8Yj0AR
	t8M1djPYY9C8jY2/ETun+qYssnxlMxweryJIH/WXKY8z6x9WexK1Mp2wDQjnHIVM
	eK3bbGLz+XKrI9A8U6xELAvtq+f/2i1+utuhKUqOLZ6yr1Kx0yIZXdVO1IMdzqjc
	t608yxRGzXDPp4JQfyOO+SvRJ/L5Xvhk5DkhbkOfSZ+y9788gHw6JWA3FPNH6TK7
	t/Jy6+VfH29pKOnQORfa6S8amuH+eOOhWbJ2cFjKopXubljJmDsyz6aFDfKhGMXj
	KUUNEo6UuJb9ZXQemLVNmsZKS9crMIuJkg0Q97crNJmeGFK0o/QLIm9AlboeDo4w
	Ohbskw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fugmghk1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i3c@lists.infradead.org>; Tue, 04 Aug 2026 18:21:24 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so176743a91.2
        for <linux-i3c@lists.infradead.org>; Tue, 04 Aug 2026 11:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785867684; x=1786472484; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4AjFf2wRc96KLV85FfeVqtVQ8LAkWfwTKk1LL7rV1DE=;
        b=beSAF50GU8UCPYb3RJdyoKI79vtkqhI4L1HOW5JBc6URJfbbPsIB4WGc9D8MURv/+S
         qn6YHP1ucunG2w981thzvf0KDH3GXVqxwhCTjtYYVBAX26aSECC16yMbmjVWMZjNnl/+
         YCLQnK0EYhSeQQksKaBhCXPaFAMvCvGdO7Mf7YRZKzXiDQMIIv+m1USQ6EI+TKMABFTl
         gq1PDvTb0JD+QLJhOWxQYOaATKcE+iD7+6W6deMbBDEUQ61RmZa6Bhtr6FmTrUWpscxu
         +9UxrJnbFrbh2k0G7w6oPVKfqEMdbwQoLPWfyae+S9/kAlA0Rp+I1p+vjvebG/CqlHi9
         Uijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785867684; x=1786472484;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4AjFf2wRc96KLV85FfeVqtVQ8LAkWfwTKk1LL7rV1DE=;
        b=LpjG8BYGbLls/kSiackmnR0+jyc53IFHFNK1cEBYON5tDXMUnXn/Scsz0j9IdFmyV2
         vwxfmEp9xsEBlg0pABQdZGkrY9g2A0SFCaKDtzpccc8xQGaDaclpvkapAqqkulARr1MR
         /soLNGDyxnbNdO3xIzNozoTDIE9l2jDh9f634C68ik4kvTz0cnqQpQdkQlw8plwkL+O+
         0NsUzrbzeCd9onc19HkKRu68cVrs+dVAc7bxB2EM2otdoA6SYH0ThW+PcG7HAi4msSev
         VOVkM7xMV8Pa/S4qoKrF5+5yLmkgOU6Eb4k4TItW/vKkjAOOEIJ4eP4JmbgM2K5F4MC0
         uXMg==
X-Forwarded-Encrypted: i=1; AHgh+Rpq4+52BdpT/0ZXs2zluojBwYChlFFHBua/s9hWbVDjaEK1xqDFn2idG67ewm1pYeajhazkBoXep5M=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3Z4EkPzacG9QrCE7x33sA9/gE2DMkZiI9uFjlczBZm8EAkWjx
	UDEUXYpKGtDxD9jAMg6E0VxPFIKXid0bON+oGABGNGleV2v021lS7aNpufevv+6AlIf/PGCNHnA
	zNhGCqXOxUrQoNVXokdQ1t/8Rlr61PwYziKJBmVQDkbXvKji3Ujn53aXculwy/UNA6I4Q
X-Gm-Gg: AR+sD12vZycL66Z703iWXPBQifuqfWnk0BK8/AfdnBeZ1wyYeJXhTt5OMH0LwktUoqJ
	dtx++5XohCarWYxzSCOz2cz59hwWAer8vAXUBHtLswxFX+2LjuY5M9ir3THI7YQ6c1vMfXW6/ot
	8wGZPzeV46WtcC1A/E0/GmfWQCipb8LezToEqdBHEVUKIVuhY0gURntvBPMq8e2kS4jPdHjk85x
	rHIenIeCD1tmppAczgAJx+vyLqXBUUaALBPkNOeBhQ/OYmcuwZ74FOVnppvHAQ4DkafuCin3Sqc
	MQeKVD/Q5EaU9OEGKBYw9vD7msofY60wG7rj61c0C82XHA2YSP1aAGr3O8sAeqDH8lTb81Cvzn+
	8N91V4wUHijlB8LDD3U/UG7Mw0XPMv2AW7Q==
X-Received: by 2002:a17:90b:5111:b0:38e:64b0:8bce with SMTP id 98e67ed59e1d1-3903c633720mr666621a91.20.1785867684210;
        Tue, 04 Aug 2026 11:21:24 -0700 (PDT)
X-Received: by 2002:a17:90b:5111:b0:38e:64b0:8bce with SMTP id 98e67ed59e1d1-3903c633720mr666592a91.20.1785867683751;
        Tue, 04 Aug 2026 11:21:23 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.234.41])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca8df89asm11465837c88.9.2026.08.04.11.21.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 11:21:23 -0700 (PDT)
Message-ID: <a67a1fd9-1a90-4c82-8ebd-bc6d7d15fe10@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 23:51:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 08/14] i3c: master: Support IBI-based wakeup capability
To: Adrian Hunter <adrian.hunter@intel.com>, alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com, akhilrajeev@nvidia.com, rafael@kernel.org,
        linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260804133810.184905-1-adrian.hunter@intel.com>
 <20260804133810.184905-9-adrian.hunter@intel.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260804133810.184905-9-adrian.hunter@intel.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE0OCBTYWx0ZWRfX34Ht4AGIcwQi
 gjGCF9m1atK68ihdOw9kAMwpM+i/YU0BFVUh/mmukcnGNbofJplhQwEiHIMH/HFZKTN28oQxBZP
 +Ltdx6n9nWYOX6m35j49YAH66e/n8YmoqS0tj8i3cnUD8DqHfnf3Ulps+LfBzyR/PYAxKSvY0FP
 LWFMB/jAOQKfQRwjVL6Dzcy3VwdBLEjElD2z6sB5jZQvI9qmYlrwECnlv28GAk2ttMbE/GM5mgh
 NL22QT0yYsnTTwgiZSrdNd5se7eneXPdUOllZqm3U9W+6jT92zphmgUk6VH8vR3dsCXcUjhf5Vm
 8z7Ib+SN9TaCi88u18Ip3n9HHT0rbTj+A32S07n3V8RNxKmH4o/4XqmTnI0p8VjXk8pisppq5gZ
 fKze/1uHAaXb2BSCokW9VHcMvjRZqg0JQ11uLPc6Qrf5/DC3m0Nl6g5WlAD4natyNi1HAtTx00Z
 y1ODQmvVZFmr2QNlWyA==
X-Proofpoint-GUID: fXbouz9j8hePK1ik4E8pCQoDM8RBODXO
X-Proofpoint-ORIG-GUID: fXbouz9j8hePK1ik4E8pCQoDM8RBODXO
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE0OCBTYWx0ZWRfX6HtsKn/G334q
 cPLKGWJ72SAFBRmwlS+93VFs70JzEf5+t44SaSBpcCprMYTLs8ylgikCmXLgA2afYylXSkR/xso
 xva8pR9AQs23YtHNaGLcwoSKmPdtxFI=
X-Authority-Analysis: v=2.4 cv=XYC5Co55 c=1 sm=1 tr=0 ts=6a722da4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=/lQgZcjXNA7ZrIsIl4Cfeg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Nx64Jw-tU8Eu9UldoZ8A:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_112125_445009_F393032E 
X-CRM114-Status: GOOD (  15.35  )
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
[...]
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index e7ea41007889..e6b320da475e 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -2110,6 +2110,13 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
>   		if (desc->boardinfo)
>   			device_set_node(&desc->dev->dev, desc->boardinfo->fwnode);
>   
> +		/*
> +		 * In the case of IBI wakeup, any IBI-capable device can
> +		 * wakeup.
you are registering a particular device to the master, so why "any 
IBI-capable device " ?

"If device has IBI capability, mark as wakeup capable" to simplify 
comment  ?
> +		 */
> +		if (master->ibi_wakeup && (desc->info.bcr & I3C_BCR_IBI_REQ_CAP))
> +			device_set_wakeup_capable(&desc->dev->dev, true);
> +
>   		list_add_tail(&desc->dev->node, &i3c_unreg_devs);
>   	}
>   
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index 2b96c4ea75fb..16394aca7230 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -523,6 +523,7 @@ struct i3c_master_controller_ops {
>    * @hotjoin: true if the master support hotjoin
>    * @rpm_allowed: true if Runtime PM allowed
>    * @rpm_ibi_allowed: true if IBI and Hot-Join allowed while runtime suspended
> + * @ibi_wakeup: IBI can wakeup the system
>    * @shutting_down: set to true when master begins shutdown or unregister
>    * @boardinfo.i3c: list of I3C  boardinfo objects
>    * @boardinfo.i2c: list of I2C boardinfo objects
> @@ -562,6 +563,7 @@ struct i3c_master_controller {
>   	unsigned int hotjoin: 1;
>   	unsigned int rpm_allowed: 1;
>   	unsigned int rpm_ibi_allowed: 1;
> +	unsigned int ibi_wakeup: 1;
>   	bool shutting_down;
>   	struct {
>   		struct list_head i3c;


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
