Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E734F483C2
	for <linux-i3c@archiver.kernel.org>; Mon, 23 Mar 2026 16:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zMIguIOD/B/POvY8D27vAGbD+XEXIKC3scA6f5VtlM8=; b=sjmFsh1sfN4Y66
	GuKZeQjCcLNwWhsmmWmG9U3bm4Guv1FwA6sEqbOJT+7qAznuzNatxUvTQRSS3yUxVZtNQSaGnwMdx
	NowEQb7kJ65nWsBvWTmCHPdyFX1fYertigcheF0VGk9ZkNLRHxHW20mdXdurIpEDh8OyPTwBod5eo
	7gKTc3n/mQjqkLPB6e/K7fS3sOc4r8ieFH805Wp1g+MaCMhl/uvjovBct2cE40lXDuTk9lYSMMYOR
	/3FSiThjanWVN0/J8c4+bVvWNXlB9HWpd+1vugrxRcwNC+I6f+rk50mJsxT2mCY4ydskBn63KZY4L
	pJ4IMWbmf5buXvukGU0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4hlT-0000000H5le-01CC;
	Mon, 23 Mar 2026 16:04:27 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4hlR-0000000H5kS-01pf
	for linux-i3c@lists.infradead.org;
	Mon, 23 Mar 2026 16:04:26 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-486b9675d36so35782105e9.0
        for <linux-i3c@lists.infradead.org>; Mon, 23 Mar 2026 09:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774281863; x=1774886663; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z+COtUFei2qqaO2M2fHrbmU2/8KjuJj/9MemH3YGHs0=;
        b=W1kj3vCl/b3GCdaRmKFYm1NTccr2VjFk548Nd393LKYFf5BSWB7M2NvusV4tlI4gRe
         cqChfeF+asjec+vQ4Lw9ZlPNKXHq/UbUucsTq6c1gcHViyG/oYAyZ86LDtLHkNa3Gf4X
         BmTxU2w0qCA1XOvg3QuWhIflM307Cv9t40bb+qNIKRKh0g2Jjnm1Vm/f9uJyRSpHz97P
         N8NSKxJcmLdp852UDvdFfD8kqHuvyP+5YCFbKSOBOGdfN0CYKHVvXcrsj3I2BFJNYAci
         2HoE3WzdGmft91vrCJesXWmgagbMxs8Jwig0vggX6NUPjgHc8TprCYhHmehWshSG/LBd
         2SFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774281863; x=1774886663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z+COtUFei2qqaO2M2fHrbmU2/8KjuJj/9MemH3YGHs0=;
        b=J61WFXh/JGrV+LN8hkdzUUXKu4ZqELH6d2AdHGQ2JHF3SGXbsj4jg5v+IWQck+jwLR
         Fl5vqiopVFwK48MWrTvtstvJmSagkZ/874IXuq6IfeVf25oFY+AiDpMAWcwqxxVusDRE
         gzyrU8az70fnQmUPmU3UbOJkKZBgVcmQ1j68O8x1CWPu5nmJ6fpIdSK1yh7kdIXPIo/3
         zlN08/Cc89At4ByiN6+NIqrqSOHX9k0dfmfdM4d3tfmFQclK0fqhqoKEYdNvc5UPmcse
         iB8h4OLgFZU7GB+kD0sqWT6EwjztOA7Vm88xrQxSm60YuowD7+jQyBoK5oBOSfKUnAOV
         t/4A==
X-Forwarded-Encrypted: i=1; AJvYcCXtKyX3ti1ELZMq73XSiuZXdm0utH4IRGwKLiPdTpaaAL8xCFxQFEbKiZwmj0ZfvQaLrajewszggs4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwFLXdiNAKbxnRLQDykxQWrKl9z1cAhkX5rkmtitmZ1iOUDGraD
	5ipQ8tNfrf/UtznMvBJonHS48kAqvpVg6PYWd4iOllZOf8dfCDh2AbBUCqnTl+/1tME=
X-Gm-Gg: ATEYQzzKyJKC2zl9RDf/zgqZVpgbWKJGISgzIfQFuIhBaVz6OmoygnDF2gQSQQMjngW
	/Qozq3PZ3zYXc1ehuT3JrYoPiHuYfdpbTALH06BG34Wvq1iILQ/eRt0++nbXeh6rqaZU2Q06k18
	YYgqtZqUFZVDcRS3C6UswRiIvFGiGICpK5NuGgXcfUKvvXhkPYLA8T+pxmMYvSjWn7MY2Hl2wUX
	VnhVH0zk9BAsdqdSVfAif8nL5cuhn2z8kReVr5kEcHTGlsYYZu4zu3Nq7h5yfouEodHtrVtA1iT
	V5ND71FJZjR2CLy1MJKVV+4h5EKoMna653LRDvL7rj4CgrKvD0jxzEOdvNjnqYw9mLO24akdrkM
	xqMsLODM74MbI5rAcW1Pbvh8n5XJGNdNUCw3Y4xZE3n0qaBe6RyeVtaYyrtq+uO87qo9PSle5v5
	cnV1X7N/SKns3uWY/KCaPZmrv//R0KcZXDgouxxqr++6XfcwnjQBfl/mCImBcicrscio/HqCNku
	Mpz3I4BSdyTPeM/VxRzX8zfmMWgbzo//1Av69OWJl/xsCQXbzQ4X4ZaSeutREtA
X-Received: by 2002:a05:600c:a112:b0:485:3ff1:d5c5 with SMTP id 5b1f17b1804b1-486febb5904mr134600455e9.7.1774281862362;
        Mon, 23 Mar 2026 09:04:22 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([137.71.226.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe7d6c54sm673968835e9.4.2026.03.23.09.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 09:04:21 -0700 (PDT)
Date: Mon, 23 Mar 2026 17:04:19 +0100
From: Jorge Marques <gastmaier@gmail.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Jorge Marques <jorge.marques@analog.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>, linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Dan Carpenter <dan.carpenter@linaro.org>, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 4/5] i3c: master: Fix error codes at send_ccc_cmd
Message-ID: <wjqd7exb3j2yn3uhu6prfodi5acteuhm7ak5a25cw3wkp4vao4@6d5dijc4dnmy>
References: <20260312-ad4062-positive-error-fix-v2-0-1c933b5c7ed8@analog.com>
 <20260312-ad4062-positive-error-fix-v2-4-1c933b5c7ed8@analog.com>
 <dd1c23f9-e74a-4370-8c7b-f20a64b5f3e1@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dd1c23f9-e74a-4370-8c7b-f20a64b5f3e1@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_090425_059330_4D38BEDE 
X-CRM114-Status: GOOD (  15.45  )
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

On Fri, Mar 13, 2026 at 08:45:37PM +0200, Adrian Hunter wrote:
> On 12/03/2026 18:38, Jorge Marques wrote:
> > i3c_master_send_ccc_cmd_locked would propagate cmd->err (positive,
> > Mx codes) to the ret variable, cascading down multiple methods until
> > reaching methods that explicitly stated they would return 0 on success
> > or negative error code. For example, the call chain:
> > 
> >   i3c_device_enable_ibi <- i3c_dev_enable_ibi_locked <-
> >   master->ops.enable_ibi <- i3c_master_enec_locked <-
> >   i3c_master_enec_disec_locked <- i3c_master_send_ccc_cmd_locked
> > 
> > Fix this by returning the ret value, callers can
> > still read the cmd->err value if ret is negative.
> > 
> > All corner cases where the Mx codes do need to be handled individually,
> > are resolved in previous commits. Those corner cases are all scenarios
> > when I3C_ERROR_M2 is expected and acceptable.
> 
> There needs to be a simple way to ensure the essential
> prerequisite patches would be back ported also, if this
> patch is back ported.  Could at least list their titles
> here e.g.
> 
> The essential prerequisite patches for the fix are:
> 	i3c: master: Move rstdaa error suppression
> 	i3c: master: Move entdaa error suppression
> 	i3c: master: Move bus_init error suppression
> 

Ack all e-mails.

Regards,
Jorge
> > 
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes: https://lore.kernel.org/linux-iio/aYXvT5FW0hXQwhm_@stanley.mountain/
> > Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
> > Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> 
> Otherwise:
> 
> Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
> 

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
