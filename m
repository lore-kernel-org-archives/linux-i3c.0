Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07704C4829A
	for <linux-i3c@archiver.kernel.org>; Tue, 13 Feb 2024 17:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+QB+d1jOTlfd1YIKKh0x4t4S4vHURbetiazm/JQQD88=; b=GcrNphW4WS24yb
	kGq8FJ2NYvVMQvNnPbM/7s5HNuDg4FGIjQc0v7zzMOXF/aEpIS64G4stYbg4mVZw51F6jfywYJLGu
	LKPdi3V1VP+inHBO62rOiUflBddBaWWW/5a3mdDjS0Gp9jEn7I4NPB76STRoCIty7B45OVefEQrgh
	1JfwxEM6Rei1giqAf3wwdSJBxgxzSVsmKqR1/Op5oP/4jATmqWAsr6FXShTrPcd3ZTvfu9Eran3od
	NC2CRoN8dBSg4boqFS/uIwLscQQUFZlm8dW8fdeM57vWaLEy6qxwS2JWNZez+XcJBktd3i+DTVGmo
	ThVmSwg7rn4W14JVsFSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZwzk-0000000ADLM-0bJ8;
	Tue, 13 Feb 2024 17:55:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZwzh-0000000ADK6-29OZ
	for linux-i3c@lists.infradead.org;
	Tue, 13 Feb 2024 17:54:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 89AD8614EF;
	Tue, 13 Feb 2024 17:54:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4ECAC433F1;
	Tue, 13 Feb 2024 17:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707846896;
	bh=O+uwyHXSZkJGTM6D+Jts/tuT9zkZbdhkWBI4Soow+ic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L7xE+02+bTSYThELti/fEvgcRkoW/5iH7T8cFS0j6c3qY3T+01xG2Pb/7Cp7OkLxR
	 iS1mhBg+Er2OiE2DLutFPOIwnBCADDtqD65Y7dhyG+M0AIGHKxG+qH6+0TtHf6DPHF
	 sFyBMh7CRTsCq2D34dHg44ZhOs9IZIkxFwg5KeCs=
Date: Tue, 13 Feb 2024 18:29:48 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: Make i3c_bus_type const
Message-ID: <2024021344-broaden-underwire-b511@gregkh>
References: <20240213-bus_cleanup-i3c-v1-1-403aea18f05a@marliere.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240213-bus_cleanup-i3c-v1-1-403aea18f05a@marliere.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_095457_616627_017D4359 
X-CRM114-Status: UNSURE (   7.27  )
X-CRM114-Notice: Please train this message.
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

On Tue, Feb 13, 2024 at 11:37:31AM -0300, Ricardo B. Marliere wrote:
> Since commit d492cc2573a0 ("driver core: device.h: make struct
> bus_type a const *"), the driver core can properly handle constant
> struct bus_type, move the i3c_bus_type variable to be a constant
> structure as well, placing it into read-only memory which can not be
> modified at runtime.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
> ---

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
