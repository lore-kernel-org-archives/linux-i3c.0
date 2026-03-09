Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13870F3C244
	for <linux-i3c@archiver.kernel.org>; Mon,  9 Mar 2026 12:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+lTakhU7P3rZzAME4hCqpNG9ADv7wpEdjag9dsKwOYY=; b=qI2CwpkvnE/gul
	wVHwnx92k3hNhOtV1BPV5GSi5StCqyzlY9XsV+4eu3n8iY/Y8BsQiI3Tt93UIGX4bti4ChJTJxXXW
	kKb866e70JbeQiQqvyTEDlEv1B/WEQDf3aNZyMIU3JnsGepKnahwncNZTUwwGiHuV8Sf5+jiYw8Uf
	5mGA/x55UUWIt1vdN314un/HKiXfwXXku8ITmzfQmjQPqIbA+dKDHWToLQyGlo+KTQyZweS6RkCWb
	FMmSTJgL42kzW36z47wfpJwn4os2CJmBUmPwsTtujpmNdiz5iaV31mlfI2FG6hJksfE9YORzhlzH7
	TR1FwTc7uNPfwdqhYqzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzZYK-00000007Ivo-3CaF;
	Mon, 09 Mar 2026 12:17:40 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzZYI-00000007IuP-13Nc
	for linux-i3c@lists.infradead.org;
	Mon, 09 Mar 2026 12:17:39 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-439c4bde55cso3971735f8f.1
        for <linux-i3c@lists.infradead.org>; Mon, 09 Mar 2026 05:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773058654; x=1773663454; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I2sa+/rFNhbsTBDOcOBWeJ36KNgJZnQgzIUUZxlS8Lo=;
        b=BBHvmxat24q/wdphngQqhRAOM1feureeJrOneQPKkbgZSbknwKUop0yqIXD1Osz1lo
         iG4Cykt6AqZRiEjMXonFKkN5QjeJwlbsrHg1NKiEUGk2Sx7+ck7WIHjCmE1Coc5GSgfR
         ir5KSuiDkG7BsjNGHieJKHued7E5A1qgwyb35WKE+GXRrJIngtx8uib0ZHlThOmeX7+O
         /50F2RqqgvJLjCjXnria4E5Io4loVV3KbPXSlZzK0ORybtYCW6AZYoZs63dFCD7PIbfG
         9SNevxsER0F+BO5is6wAIVkF+36SQDoJwExAxgC34eLPwiPJM9HvyLgfTja4VojOco4r
         asmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773058654; x=1773663454;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I2sa+/rFNhbsTBDOcOBWeJ36KNgJZnQgzIUUZxlS8Lo=;
        b=tLHMunLzxcySoa0KLAsdrbnCndo0UWcdjLZ+cmEtmSPAQ04URpn7UjPGA1tiq/rqek
         xODyC++mEV2OAwH7tkU/0LI0vMHG7V0E2g6o0QKLHHp1Bc91UWAB8QHdKK7HmuU9dH29
         zqY9tfEZvqfCrlCHLCNLK9P6lTuHSzb4STLoTUVsswWHuYemkayoL6NfIPUnZIX+5X4I
         k2WQmQyrHonyE8t/I0RsP93+Q2A9e5NKrmtdQvHHIPEXPYgm5cVjupcfmKySV+v8Yuwr
         BroeNNM/1B44QLHjJ6SGKRUM9BHZiH24/YVT4J0+hjVs9b1Ej8/bj32+P+8dqcuBnEHm
         qcDg==
X-Forwarded-Encrypted: i=1; AJvYcCXyp1O9r95YxksaeNocY/mMNHG14ZbfjO/S6L8WwxhZ8ldGIRhGpAX+k2N8ngoXTxDrkiQZ/jXScKc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwgAMh/gOh+CGM4YUC/n9Y/6uMSrecDb88tOLBPp/V0/48SdoaB
	uTyUElZ7cttFszU3x490wRdp2lyP1WJMiEQQ6e72Kv5fty1QFWV3xkwP
X-Gm-Gg: ATEYQzwBPrMa5ElHIUkSy4dTFQE0bDMMHcujWY1P6w/jeJJoWpHZXsQSf6KZxwhRczS
	Akkpx5OKMDH8Dhm/ejqwNFHxpshbwPpJ4KLUJEFh3vbqYU+oy0N2Dk9Eu2XnD8yGLM/2NYq25Gv
	+m3k6MhChfiNiHFH/IeAM6cvaQ6cBpiTHgKPaB24Q8YkZjDGJEUZATd37N9vXGjcJBWtGK2MPLr
	z20oIZMrz3MTxdldEsul+wESROhSxSY9Gl/IAMEEt3clLBPB5uxKGEIL3WOnzOzRCyY5j2y79U8
	PqS4/QyVrbSvqWwMiDfDnXnoEM/RaDgenNF0f5dnc2ANbZNHF5MWvWix96QNbxw7evMaqLoYcYO
	+1QsOUd6LgSfnLNbTGGwEEag2HEhxlalbE3Vm5GFwiC1Is94tfsIBck+D0YyAlrodvKUFdRsw7k
	Shzi/RzA6bO1S2TklURT4uDEdkTSEmSBcc3lsoIyVh1NUsQe0raQETQvIaBRSCiZyAUCBjO7iz5
	HnY8/hj5d+RpxdrAGrktIaALC/TUGPPbh6y0YS9iIS2lBTEB+G9rYjX6Q8E8LWkew==
X-Received: by 2002:a05:600c:6387:b0:485:3983:aba8 with SMTP id 5b1f17b1804b1-4853983ad1amr59795175e9.27.1773058653994;
        Mon, 09 Mar 2026 05:17:33 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([137.71.226.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4852e38c013sm362096425e9.8.2026.03.09.05.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 05:17:33 -0700 (PDT)
Date: Mon, 9 Mar 2026 13:17:30 +0100
From: Jorge Marques <gastmaier@gmail.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Jorge Marques <jorge.marques@analog.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>, linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Dan Carpenter <dan.carpenter@linaro.org>, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 1/5] i3c: master: Move rstdaa error suppression
Message-ID: <k63sp56mbqje2wqo6yjcql27ag7pkwbuwch7llnal7j6sww4wp@3bnal4rcgpzn>
References: <20260308-ad4062-positive-error-fix-v1-0-72d3c5290b4a@analog.com>
 <20260308-ad4062-positive-error-fix-v1-1-72d3c5290b4a@analog.com>
 <458bbbb3-babd-45d2-b290-435811058ba3@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <458bbbb3-babd-45d2-b290-435811058ba3@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_051738_305624_6362D67A 
X-CRM114-Status: GOOD (  22.03  )
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

On Mon, Mar 09, 2026 at 01:39:36PM +0200, Adrian Hunter wrote:
> On 08/03/2026 18:47, Jorge Marques wrote:
> > --- a/drivers/i3c/master.c
> > +++ b/drivers/i3c/master.c
> > @@ -1016,6 +1016,10 @@ static int i3c_master_rstdaa_locked(struct i3c_master_controller *master,
> >  	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
> >  	i3c_ccc_cmd_dest_cleanup(&dest);
> >  
> > +	/* No active devices on the bus. */
> > +	if (ret && cmd.err == I3C_ERROR_M2)
> > +		ret = 0;
> > +
> >  	return ret;
> >  }
> >  
> > @@ -1785,7 +1789,6 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
> >   */
> >  int i3c_master_do_daa_ext(struct i3c_master_controller *master, bool rstdaa)
> >  {
> > -	int rstret = 0;
> >  	int ret;
> >  
> >  	ret = i3c_master_rpm_get(master);
> > @@ -1795,9 +1798,9 @@ int i3c_master_do_daa_ext(struct i3c_master_controller *master, bool rstdaa)
> >  	i3c_bus_maintenance_lock(&master->bus);
> >  
> >  	if (rstdaa) {
> > -		rstret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
> > -		if (rstret == I3C_ERROR_M2)
> > -			rstret = 0;
> > +		ret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
> > +		if (ret)
> > +			goto out;
> 
> This is an unrelated change.  The original intention was to perform
> DAA even if RSTDAA fails.  If you really want this, it needs to be
> a separate patch with separate justification.
> 
> >  	}
Hi Adrian, handling I3C_ERROR_M2 is unchanged.

The intention is to perform the DAA if the RSTDAA fail due to a
I3C_ERROR_M2, this behaviour is unchanged, the duplicated error
suppression was moved from the do_daa call to inside
i3c_master_rstdaa_locked, and added a comment to explaining why it is okay
to fail: the i3c controller may probe, without any active i3c device on
the bus to acknowledge the CCC broadcast transfer.

The core purpose of the series is to fix the accidental propagation of
Mx error codes where 0 or negative errors are expected, to achieve this,
the error suppression have been moved to scopes that contain cmd.err and
clarified why they exist in the first place, to not have "ret = cmd.err"
anymore.

There are three exceptions all related to the bus initialization:
* RSTDAA -> i3c_master_rstdaa_locked
* ENTDAA -> i3c_master_entdaa_locked
* DISEC (broadcast address only) -> i3c_master_enec_disec_locked

I was actually wondering if it wouldn't be more adequate to call a
"probe bus" broadcast CCC that would be the only acceptable to return
I3C_ERROR_M2, and if so, we don't do the RSTDAA,DISEC at all (no i3c
devices, why continue?). But since ENTDAA suppression is still needed,
because the DAA always ends in NACK and the specification doesn't
specify if the RTL should suppress an I3C_ERROR_M2 after the ENTDAA
initial ACK, the benefits are minimal.

Best regards,
Jorge


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
