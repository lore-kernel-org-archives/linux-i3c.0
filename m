Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C89CE7A8B
	for <linux-i3c@archiver.kernel.org>; Sat, 23 Sep 2023 08:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kN88YsfIbZ2I9x25M6A+FylJdjmdtjGQTt7TtfsNXS8=; b=zaqVJtjh/RQ0sp
	Z5CGFpNDmtSy5Ge36S1Lbnkf0CQ4MvRTJ2f2StcA92fLnLD7TJ7G2mPNdo/YVBw+9AO6OtSmeeMzU
	rL/Tfqjflue98erQnECK4wOQfLhmsPE27L9S7d7X0SqEo+S8ow7wowVDZ0emY0rN9efe5c16rVqjG
	rieSJfDDoV7EPv6RF8b8zF6zK5j4dobqyUBHRwhIAVKlpRp/EAU/JCUNaoK/FoVfcUUf98OkJ7LWk
	COLxLIvfjCThOT+qZzPxIkov0bM2fHBl/9DbBUFmaf77AIqv+NCNFI6qPM1IEdgWTJs+/qyV09XMM
	ERgu+JQp9KL7SHIBvjag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjxzX-00AdtQ-1v;
	Sat, 23 Sep 2023 08:27:55 +0000
Received: from omta034.useast.a.cloudfilter.net ([44.202.169.33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjxzV-00AdsF-0c
	for linux-i3c@lists.infradead.org;
	Sat, 23 Sep 2023 08:27:54 +0000
Received: from eig-obgw-6006a.ext.cloudfilter.net ([10.0.30.182])
	by cmsmtp with ESMTP
	id jnFQqEyrKez0Cjxz3qArOB; Sat, 23 Sep 2023 08:27:25 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id jxzQqBGgW3FgHjxzQqTBIy; Sat, 23 Sep 2023 08:27:48 +0000
X-Authority-Analysis: v=2.4 cv=F4tEy4tN c=1 sm=1 tr=0 ts=650ea184
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=P7XfKmiOJ4/qXqHZrN7ymg==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=P-IC7800AAAA:8 a=IpJZQVW2AAAA:8 a=7YfXLusrAAAA:8 a=QX4gbG5DAAAA:8
 a=JfrnYn6hAAAA:8 a=cm27Pg_UAAAA:8 a=VwQbUJbxAAAA:8 a=HvF037n1xESchLcPDVoA:9
 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22 a=IawgGOuG5U0WyFbmm1f5:22
 a=SLz71HocmBbuEhFRYD3r:22 a=AbAUZ8qAyYyZVLSsDulk:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=xmb-EsYY8bH0VWELuYED:22 a=AjGcO6oz07-iQ99wixmX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3BINsmqXz1Xyl2+8Q/ewcOfCUe3yZ9S3ok1tGaIGWpQ=; b=dfRIeyp17Ir2q5YzY/Lu2aJVlr
	yZ90fP3exjLnH7hpn4aXidpYSZy7TEreWDUzBr+zE/u7hm10l8tH2v09Jy3KbgfTdjvAh8bHqm73f
	QrF74948pSNHfGzh/GwWAW2obItxIHLqaD5im6CD9RoHY/dPWtLULF2EY+RKpyaazNpfujqqvkNF6
	ZZA8SapT+68yoQpT/PY4yFVqottgii1rPWhDEMe/C6BA928gDmySrxiVaSI9QMyaOB3Zpq2P99SuT
	iiCaxNoBAJ/Sdp/xv56x9RWUsSazrXRR+e7oalrawFvefXibTjvZ6FYLRW6IR+9FNH3NYFP7oEDiv
	xUr7tVZg==;
Received: from [94.239.20.48] (port=40090 helo=[192.168.1.98])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qjxzP-003XHR-0X;
	Sat, 23 Sep 2023 03:27:47 -0500
Message-ID: <9ae58a8a-04c1-90ac-cf50-7366bff42084@embeddedor.com>
Date: Sat, 23 Sep 2023 10:28:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] i3c/master/mipi-i3c-hci: Annotate struct hci_rings_data
 with __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Nicolas Pitre <npitre@baylibre.com>, Len Baker <len.baker@gmx.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-i3c@lists.infradead.org, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230922175019.work.129-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230922175019.work.129-kees@kernel.org>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 94.239.20.48
X-Source-L: No
X-Exim-ID: 1qjxzP-003XHR-0X
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.98]) [94.239.20.48]:40090
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 72
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfF8piAEwWSKhtXSrUhMjLf/BJ/ZYoN1cKDt4+utl229Lu8goy+/g+Q3BSCTS0Itv9LXQZIQn2p7o8LYJBRS9FbIDJbSgs5UtS3lQ7mNz3KPPySCurcmp
 nX/Xa4GS8cx5cgFcbMpm30H4rySqZpMXTGrOBolXMJIb9veXEdlUaxgqqabwv8L/KrfnggUwEgiXPeus7vWi+Dls0XdzhHp8C7M4M2EzzgUpIfyNezJeDmGb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230923_012753_290623_1042A56B 
X-CRM114-Status: GOOD (  11.41  )
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



On 9/22/23 11:50, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct hci_rings_data.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Nicolas Pitre <npitre@baylibre.com>
> Cc: Len Baker <len.baker@gmx.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: linux-i3c@lists.infradead.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
-- 
Gustavo

> ---
>   drivers/i3c/master/mipi-i3c-hci/dma.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index 2990ac9eaade..a1ecdfc35641 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -139,7 +139,7 @@ struct hci_rh_data {
>   
>   struct hci_rings_data {
>   	unsigned int total;
> -	struct hci_rh_data headers[];
> +	struct hci_rh_data headers[] __counted_by(total);
>   };
>   
>   struct hci_dma_dev_ibi_data {

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
