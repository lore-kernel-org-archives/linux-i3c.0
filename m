Return-Path: <SRS0=M/mW=E7=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F5FFC5519F
	for <linux-i3c@archiver.kernel.org>; Wed, 25 Nov 2020 09:57:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EE682083E
	for <linux-i3c@archiver.kernel.org>; Wed, 25 Nov 2020 09:57:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yCKSreoE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="hHQILDw0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EE682083E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ejdqu/BYUsDmQbqFDvqRXPqoDQOfwZgqVcr6qoG7CAg=; b=yCKSreoE4jrwDHqE8Ac/cXjb4
	O4/plKtgzT0RyGAvQLqw8/L78iyqj/41/k9ckYiR9qgByGqcy35a3FqbXacUIf1ZQna1t3PH1gUAr
	JdnvH3iKpOJ8LZ0Y+W2w9ZJ/u/1Og1hOYm6CcMz6zl2eJiL+nfsWnq9qLolYmupAezEGsbtxvkk4p
	8wx+almtIpstgDoT4V/ulbrduSyPj7KbROTxTL4ttfHgLPPiIoFARupVJiBRWDsNsFey1NHL7NT1P
	hDC8j+MGvdDTeoNEyUl7MDdfVwe7tEpatnjqliUiQ9P/ZaWP+TcPGntUJcT55BweZW4BUojjMeW2l
	witwwHJsg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khrYE-0006Zr-MA; Wed, 25 Nov 2020 09:57:26 +0000
Received: from mail-qv1-xf42.google.com ([2607:f8b0:4864:20::f42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khaY1-0004Rd-ST
 for linux-i3c@lists.infradead.org; Tue, 24 Nov 2020 15:48:07 +0000
Received: by mail-qv1-xf42.google.com with SMTP id x13so10793923qvk.8
 for <linux-i3c@lists.infradead.org>; Tue, 24 Nov 2020 07:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :mime-version; bh=ubJInrGSsPLGKGouG7fpjnMRMu6mjU1dee+kkLRQJso=;
 b=hHQILDw03u/sl9BOCAlhrVjo9pT1JNk1zqKicW8pDpjpdemn2tv0bQrmpqWWp9TJPp
 9WRL3NIb6Oyo/7pQmptCxsdnzIgS4TZC+smRhtxd34Vj6OvTCQWwuPS7kFj2+UAO0Xgy
 4/0c9vuOfTsKe5SFMTjEs+G8oz0P5j3G7CxmCLKbzuAE8hevvUEVPk5huxPVSZ4cBm7f
 JVIG/DOVhd6fUdJA+yPBVPBoMjucv8i/mhsuJdwb+V9mEc8pocbx72lGwXRhFQ7FxBYO
 c4k508M0ay+aTrTr3wbwrpo4b+kQu5nNDoW/aFjAK/pypvbh7Cby3FBjs7cmT3ChR44g
 IlVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:mime-version;
 bh=ubJInrGSsPLGKGouG7fpjnMRMu6mjU1dee+kkLRQJso=;
 b=FrY8rVG1Lx7P5NyeqrRK6wRHRs3Y2Zl/bmX6yX3+2nDtLggogS8wi0efTsOzaWYfnT
 2wpMAq+imz3i9hTEZLW/vqj0h/cNxs8mWoTn07B+XqWspUsVI6Ecj7mUyoNJQdfKpiQi
 qruybofTTM6fnmny8kCFB3hbQRMNFW8Rjbl0TDq8FFoWTfV9VyJ78tcccXXOC7j/KACJ
 /gwby0qIBCLaDDBMEGDlVPmjUoIbECpbiDWLCE768p5atvXqj+d9sIgLbWrM9K62dCaw
 VkIZG/nQD5IE18/EGCsHRVZ5oVtGmu7nukIAinOq59Dcxa8NJoMD1eoxiFO9CB5Jeqlq
 pgjw==
X-Gm-Message-State: AOAM532GZ6jw+763jYtu4DXEo1TECizlJdueFj8uek3uTIZaHRCTW8y8
 36KZpgshngIBWazEzFHJjZ992w==
X-Google-Smtp-Source: ABdhPJydlpNAWXjt4Gk87KvAf/FoPLdSEj4YPKw88iYN9nz6ZjtmfbEXGr3ZkwuOUekwx2ztrZ7ydg==
X-Received: by 2002:ad4:524b:: with SMTP id s11mr5485759qvq.3.1606232882237;
 Tue, 24 Nov 2020 07:48:02 -0800 (PST)
Received: from xanadu.home (modemcable076.50-203-24.mc.videotron.ca.
 [24.203.50.76])
 by smtp.gmail.com with ESMTPSA id i9sm12931180qtp.72.2020.11.24.07.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 07:48:01 -0800 (PST)
Date: Tue, 24 Nov 2020 10:48:00 -0500 (EST)
From: Nicolas Pitre <npitre@baylibre.com>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH][next] i3c/master: Fix uninitialized variable next_addr
In-Reply-To: <20201124123504.396249-1-colin.king@canonical.com>
Message-ID: <nycvar.YSQ.7.78.906.2011241046530.2184@knanqh.ubzr>
References: <20201124123504.396249-1-colin.king@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_104806_072329_A74C9316 
X-CRM114-Status: GOOD (  17.02  )
X-Mailman-Approved-At: Wed, 25 Nov 2020 04:56:58 -0500
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Tue, 24 Nov 2020, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable next_addr is not initialized and is being used in a call
> to i3c_master_get_free_addr as a starting point to find the next address.
> Fix this by initializing next_addr to 0 to avoid an uninitialized garbage
> starting address from being used.
> 
> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: 9ad9a52cce28 ("i3c/master: introduce the mipi-i3c-hci driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Nicolas Pitre <npitre@baylibre.com>





> ---
>  drivers/i3c/master/mipi-i3c-hci/cmd_v1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
> index 6dd234a82892..d97c3175e0e2 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
> @@ -293,7 +293,7 @@ static int hci_cmd_v1_daa(struct i3c_hci *hci)
>  {
>  	struct hci_xfer *xfer;
>  	int ret, dat_idx = -1;
> -	u8 next_addr;
> +	u8 next_addr = 0;
>  	u64 pid;
>  	unsigned int dcr, bcr;
>  	DECLARE_COMPLETION_ONSTACK(done);
> -- 
> 2.29.2
> 
> 

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
