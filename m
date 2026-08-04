Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9169AC55822
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Aug 2026 19:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EpPj6KbMVi606lVVHr6QOh9xWl8Dw3Gf6UbEVsd8+Gg=; b=gGdM50FZDtm88p
	gnkgHiKBpwpBcdA6ksiRQsd8J20Uof2pOzfjxjOKwLLnv/PoJy4Q0aFmB9AlJhcAM2wp9b9AxKoVE
	vISEthOlLa8pkOCADez3pfXQlfAfoqME1aOGlGmJJ7UM9pfmQTiZUINs7H5gqaJDCVnGoG6O0GdpZ
	gcqEWiFCX9d/xLobCdTCzYuXZdfyjdc2RjVPXih4TZh9LXRcDNmfbALCzrkqzXSYXVRQfB3oqi13X
	Paq+zD4L+qlbvGEMqKijkJkdit4AjdK/Toutbq10SfgefYcSlJzyus/lpY3CVW3Lip3W4pmOhtJy+
	tMLBxpCM3ihgzjCaX/6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrKog-00000002gFO-0AqM;
	Tue, 04 Aug 2026 19:28:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrKod-00000002gF4-2m33
	for linux-i3c@lists.infradead.org;
	Tue, 04 Aug 2026 19:28:45 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674J06XK668840
	for <linux-i3c@lists.infradead.org>; Tue, 4 Aug 2026 19:28:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MhA2IU8196JWiRByXGGWXt3G4pGVswpFZCS5BuGud3c=; b=FtoZWcBQaIRPkYal
	jZp2fkeDjiWsLFp6JJZovb7cSZqmsLq3f2SU8fyla0+5dREDVS8kDvqBltSv+Ffb
	gfGmdJxPsaIobwrsD5aKZakAqkBzV4UD1PiL1trVoG1XVlsJ/guKpsp/WHv9Gpqe
	fGLOaOq18enyM+G6fB0eOCiFlv98DeIfb8N+nx/UzNIqbQhEOIpJ+4MoNhwuXqkU
	grGy5whG2gKlk8jq54G1BPWhwE7FxPnexC8CLzaSsDd3ETy/+Ep7vx3t2DdELTep
	ig7FGsXx7bWAdVhnOrKPAjju6YVHVK6NOSyJ34fKIATrpNEjmV1Lu7natRrkMpiz
	dOUtIw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum56gps6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i3c@lists.infradead.org>; Tue, 04 Aug 2026 19:28:42 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c9fe4c5eb39so86697a12.1
        for <linux-i3c@lists.infradead.org>; Tue, 04 Aug 2026 12:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785871722; x=1786476522; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MhA2IU8196JWiRByXGGWXt3G4pGVswpFZCS5BuGud3c=;
        b=fsEzeXk7IH0+8UOlizvspKdL1+PWXcV0oyAc/hzx1kBjsNTnm46eCpsSzAQMAS9wM3
         X33Wk8ZARs4YggarTE5Nc77iUwmsGdEH5abxamFgxvcRhV+RtsD035lkmX8DanZ7tU7T
         KmLlUmA7AOUpES4rh+Qy++Ot8wUwfb6jVi8IHmbBPESPYb771ha/ORee9E4gf0kypQFM
         76yle6FLhpolcU5z1LuJsWsy0owLWChdDVnqv3k5CwTrMNUgoU3vc978yuy57KE8EZVy
         CljN5OU1F7y0nKzE5Hrmp58KEkmR4Ve+y5YXGWpYeRU4mWcnzcebxvgTlmRLEJmc60or
         HmgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785871722; x=1786476522;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MhA2IU8196JWiRByXGGWXt3G4pGVswpFZCS5BuGud3c=;
        b=hMqYW7g4rUNL47NzcegyhMP+DlDKRtEujA9vOBIMQcbDLzkzHXB3rbOCpxKc4R0XH5
         +LrVEX0eqOZYThI4bdwSJIyZKeDUoDL9G0U7kTgSbgxbsH+NmO+Mx5KCSimHwj8RRJ+l
         uwe7OzfWH+PmJh1KSMU4PuxeY0yvBX/w9tuOGfAqML0ZDyVCupO1gY62KHSNISb1RvDX
         V9IiGucRFZT/e1Krf9yWE7+9dbXS1gt8TIWUg2maEcJbVnZH26lQ9ZW7oPdCl/6J0WL0
         T5GWjq6Ke+AXcsxJSNkGA23tX65Ypfs5/e5xmoev0tZ/6ZDZJQrBCbFnizTos8/kMiiQ
         OA4A==
X-Forwarded-Encrypted: i=1; AHgh+Rr9rVsIv/bLh1hjiNPuLOjowmT+w/ML5ChPz4JtPky3uf5b8wi0BU2LbZGH3LGUXNYe2YJw4949t58=@lists.infradead.org
X-Gm-Message-State: AOJu0YwsJEYqLSs1zGFHRLZKO7IKwfPULyWLZTw+jGMVER/2DXIKqNY/
	GP86lTN4T0Ugw5M782JG47iwo4ZOzuztNd2VAuJLSNHUpUAzIF9KWTtgsHTHnH9xUWmesbtvZ7r
	KBv9ZikTR2UMLS9CZJLENuGx2FfdGrFHeLWw/s3T3jipbmMn747HgHS+nKi8fSzDOJiRT
X-Gm-Gg: AR+sD12PAXW/Jv2iTkr0PIJXTc1+a7G8IAiwdSqIJFikQJf0V+tBc0T9cterY6wDVv3
	z6U5ZTJhIGitPsBntISOIqxy+jcbSr0JlIhhQRk+bnypDB2VOWLBWmDwB4YXNHOTdIs6VM1fH4f
	34SvRjE99/17/CC7wdiOVdLi6XFlN+eWLM7JzfNT53QgVzoJvOqi/BOhXuxBQTKEb+oK8Q4JJOM
	LcXA2yMfxa9/yXr7YNxS4sEpLxYaWtGxiGBQrwe+BOO4zsaDRCr84s2VTNzZ438J0dTtS8i2bHK
	oqJap57tecUZHbp08g/m3ktVC1qbDLZHxMii5Yhzgs909sWQc+2mYozJ0km53OA7rFQEegwPZPc
	lKxDLs3pmm27ev/6cHji8gol90sz15hbD+w==
X-Received: by 2002:a05:6a20:2447:b0:3bb:2883:a723 with SMTP id adf61e73a8af0-3cb86075abamr805120637.35.1785871722310;
        Tue, 04 Aug 2026 12:28:42 -0700 (PDT)
X-Received: by 2002:a05:6a20:2447:b0:3bb:2883:a723 with SMTP id adf61e73a8af0-3cb86075abamr805086637.35.1785871721856;
        Tue, 04 Aug 2026 12:28:41 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.234.41])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158678ec37sm7150623eec.23.2026.08.04.12.28.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 12:28:41 -0700 (PDT)
Message-ID: <6698bed9-373f-40f3-819a-25203245f733@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 00:58:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 13/14] i3c: mipi-i3c-hci: Factor out i3c_hci_sysdev()
To: Adrian Hunter <adrian.hunter@intel.com>, alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com, akhilrajeev@nvidia.com, rafael@kernel.org,
        linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260804133810.184905-1-adrian.hunter@intel.com>
 <20260804133810.184905-14-adrian.hunter@intel.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260804133810.184905-14-adrian.hunter@intel.com>
X-Proofpoint-ORIG-GUID: YLywEAWUjY45tZwyGC_wPj65lDSRAxUQ
X-Authority-Analysis: v=2.4 cv=Co+PtH4D c=1 sm=1 tr=0 ts=6a723d6a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=/lQgZcjXNA7ZrIsIl4Cfeg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=RAI3vUJYwi-tdmbA44AA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE1NyBTYWx0ZWRfX515DKxGmwkyJ
 fEx4ZCT63Xrd7r9NhC6GI0kj4IThSDkDF8dynfNdtDfs8/raUFcKVg2OuAUSoQpIiKYHQ/GHk81
 PQ/HhJdVdxVZDRfdiKhYdVmg8O87ORk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE1NyBTYWx0ZWRfXxhLjSPw73dxw
 JcAZyme5hnzHfC0Q3R9THxDN3ikDrHwsK0exwf+I0++sPYwqCe+5IcRSsyZ6/iwk5IMQu9SwC5W
 p6a4bHggoqD4vk6zGVQnUS8u3nwn9UqxyDZFD9zZtws5HnKwJMtiTIY0jl5IoB/T70J76aq5ciU
 CrNLfJT0pKP+NcOnbw1jBVq1cTwjvWpSOn8bUgxJZ6ueyWxOGvrxT+mT8Iy1NLPBcn6VjqWIl0W
 wzndGxg5x71Qyo3g3caapd4FQ74I1U34C+qilhHr9jZV+adXURFaZ1RsezPqIqWmT+J67/xvhxX
 7bPvvpjx/LXnRsPO1qAJ9rJ4X5I6g3A+JfUdLNffRRdFjGc3nDGxVdyZJEHZdgpENHMnZhaJxAE
 NjfJk4P070m2YHwWpE8OnJIozcImAb0gWEMW+eGPGqr9ZmrkvAuCT+0R8OfNoDHI6b3NMl6ZpbV
 9WafHWY9dgzF4WKHHQQ==
X-Proofpoint-GUID: YLywEAWUjY45tZwyGC_wPj65lDSRAxUQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_122843_706188_4EA3C8BD 
X-CRM114-Status: GOOD (  22.35  )
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

Hi Adrian,

On 8/4/2026 7:08 PM, Adrian Hunter wrote:

[...]

> @@ -117,6 +118,17 @@ static inline struct i3c_hci *to_i3c_hci(struct i3c_master_controller *m)
>   	return container_of(m, struct i3c_hci, master);
>   }
>   
> +/*
> + * Determine the device that does PM / DMA and has IOMMU setup done for it in
> + * case of enabled IOMMU (for use with the DMA API).
> + * Such device is either "mipi-i3c-hci" platform device (OF/ACPI enumeration)
> + * parent or grandparent (PCI enumeration).
> + */
I was kind of confused and could not understand much (excuse me!). But 
could draft below from function definition. I know comments removed from 
below function and kept here.

Hope this can be simplified or improved further if possible.

/**
* i3c_hci_sysdev() - Get the device used for system PM and DMA
* operations
* @dev: HCI device
*
* Return the PCI parent device when the HCI controller is attached
* through PCI, otherwise return @dev itself. The returned device can
* be used for system power management and wakeup configuration.
*
* Return: Device to use for system PM and wakeup handling.
*/
> +struct device *i3c_hci_sysdev(struct device *dev)
> +{
> +	return dev->parent && dev_is_pci(dev->parent) ? dev->parent : dev;
> +}
> +
>   static void i3c_hci_set_master_dyn_addr(struct i3c_hci *hci)
>   {
>   	reg_write(MASTER_DEVICE_ADDR,
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index 0672ed1132f8..7c2b20474130 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -15,7 +15,6 @@
>   #include <linux/errno.h>
>   #include <linux/i3c/master.h>
>   #include <linux/io.h>
> -#include <linux/pci.h>
>   
>   #include "hci.h"
>   #include "cmd.h"
> @@ -301,23 +300,11 @@ static int hci_dma_init(struct i3c_hci *hci)
>   {
>   	struct hci_rings_data *rings;
>   	struct hci_rh_data *rh;
> -	struct device *sysdev;
>   	u32 regval;
>   	unsigned int i, nr_rings, xfers_sz, resps_sz;
>   	unsigned int ibi_status_ring_sz, ibi_data_ring_sz;
>   	int ret;
>   
> -	/*
> -	 * Set pointer to a physical device that does DMA and has IOMMU setup
> -	 * done for it in case of enabled IOMMU and use it with the DMA API.
> -	 * Here such device is either
> -	 * "mipi-i3c-hci" platform device (OF/ACPI enumeration) parent or
> -	 * grandparent (PCI enumeration).
> -	 */
> -	sysdev = hci->master.dev.parent;
> -	if (sysdev->parent && dev_is_pci(sysdev->parent))
> -		sysdev = sysdev->parent;
> -
>   	regval = rhs_reg_read(CONTROL);
>   	nr_rings = FIELD_GET(MAX_HEADER_COUNT_CAP, regval);
>   	dev_dbg(&hci->master.dev, "%d DMA rings available\n", nr_rings);
> @@ -332,7 +319,7 @@ static int hci_dma_init(struct i3c_hci *hci)
>   		return -ENOMEM;
>   	hci->io_data = rings;
>   	rings->total = nr_rings;
> -	rings->sysdev = sysdev;
> +	rings->sysdev = i3c_hci_sysdev(hci->master.dev.parent);
>   
>   	for (i = 0; i < rings->total; i++) {
>   		u32 offset = rhs_reg_read(RHn_OFFSET(i));
> diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
> index b3d9803b1968..b8d2a3d680f8 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/hci.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
> @@ -184,6 +184,8 @@ void amd_set_resp_buf_thld(struct i3c_hci *hci);
>   void i3c_hci_sync_irq_inactive(struct i3c_hci *hci);
>   int i3c_hci_process_xfer(struct i3c_hci *hci, struct hci_xfer *xfer, int n);
>   
> +struct device *i3c_hci_sysdev(struct device *dev);
> +
>   #define DEFAULT_AUTOSUSPEND_DELAY_MS 1000
>   
>   int i3c_hci_rpm_suspend(struct device *dev);


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
