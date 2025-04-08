Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59AFFC36010
	for <linux-i3c@archiver.kernel.org>; Tue,  8 Apr 2025 19:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BzyeyAvmFLuvDEZ/vYyoIvc7j2b1Sy6sVOosGyoIe1U=; b=tpf12xL8Trk2FY
	PHVf3RJ7vSsfIUtAjp26HpyWgQur6tNVi2Zm/kO2Cc6NEFZIfvSFiRDyNi1EBIJ0Rw3lFIAThSDh4
	q9n6/XSwZg3sMbQgB9jMbmRtQ66Q9vGcmSZMEMU2MxgEiJOSWe6PoqKn31VNRxriZ8y+pkpuj3cXt
	KElFZw4jfitry/B3ze+KKpHhOU5O2AZ925NXPnvEHG0ey35IpX2xuE21sw36q+Nx+5n+1vittjW/t
	AXo/kPWOWlmuHCpcrg/x7A5uNVuyP+5lf+EsdmwfA2wbku00lFLvYMks3n/Pw0u8RIGqDSmiQE2U+
	HZra9R9O67OGddrvhKig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2F4w-00000005HbW-46Vw;
	Tue, 08 Apr 2025 19:57:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Dtv-000000058jJ-2lkS
	for linux-i3c@bombadil.infradead.org;
	Tue, 08 Apr 2025 18:42:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=o0l2+eulm+D6krMIgvimj+MqY6qkMjc7oo9BRuxg8I8=; b=HHrDqjjY0vOT1p90vFcRalVKjF
	3sRSav6AL2M4jg2bC9/elKu826PoU6j35AalSBPIHDlO0TPK0UMe2mqmM6nYbiHo20TAGi3yE85At
	5msdTV92Nrf+LbptkFn84qsqY2rEEKvix+ViAZpW7zB0Ty5nCFMkBFra7K2RY5tDrdz0I55PzQ+4K
	e5L1GITgYbmjVXaboXrqSvrvIvsYzTEk1K0PupsxUkU1a+Q4kqfvGyw/Ji5/fXBt7+sBWu0EAgFPk
	KvoIK6vj6ITmsmwX1H4dYOWqbvZpTuTseBBVROgp6PkR1QirPeHctirnF639oa5bv4cx8CK6wNr7I
	dNqUEouA==;
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2Dtu-00000008OUQ-0e4c
	for linux-i3c@lists.infradead.org;
	Tue, 08 Apr 2025 18:42:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4862E615E9;
	Tue,  8 Apr 2025 18:41:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B64CC4CEE8;
	Tue,  8 Apr 2025 18:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744137680;
	bh=2JCeKhylGA88w4rapiu31U+WsTfpRRkmDM8v7X0UhNU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k09Os5FFB3ivCj7FfEJT2na8lw4kYPJoyHqVlmD7x9gIYW8QHxLFFF8QTOH5Kw62y
	 +ReF51NqaB6epW50x7GNEHnjIOKXq40JwLlsr9Anxi50uHPPPrj9rGzRhHEMKZvdzY
	 12N0/DVb2hSsvAerXFtGb9CoBVYiqvCORzuCX9iFLdgC399ViUuVjhQFsfk77dE6Bg
	 KXSYbZ3xIs1N1DOGxJxfFElJbO7JFHUjK/K5u9xa+/22yxrtj4D1lHdFcRuW+3dXZn
	 LZjxjMKzCXqns5IxscJojbD8inajktKpXAezAz9RQeD8A3400z9c3gcH464apSVPsc
	 KqjVgdH/4xPRQ==
Message-ID: <e93c50ce-30dd-45ef-b945-019e703bd7c3@kernel.org>
Date: Tue, 8 Apr 2025 20:41:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] i3c: master: Add Qualcomm I3C controller driver
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
 linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 andersson@kernel.org, konradybcio@kernel.org
References: <20250403134644.3935983-1-quic_msavaliy@quicinc.com>
 <20250403134644.3935983-3-quic_msavaliy@quicinc.com>
 <20250404-provocative-mayfly-of-drama-eeddc1@shite>
 <4fe9f898-63bf-4815-a493-23bdee93481e@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJgPO8PBQkUX63hAAoJEBuTQ307
 QWKbBn8P+QFxwl7pDsAKR1InemMAmuykCHl+XgC0LDqrsWhAH5TYeTVXGSyDsuZjHvj+FRP+
 gZaEIYSw2Yf0e91U9HXo3RYhEwSmxUQ4Fjhc9qAwGKVPQf6YuQ5yy6pzI8brcKmHHOGrB3tP
 /MODPt81M1zpograAC2WTDzkICfHKj8LpXp45PylD99J9q0Y+gb04CG5/wXs+1hJy/dz0tYy
 iua4nCuSRbxnSHKBS5vvjosWWjWQXsRKd+zzXp6kfRHHpzJkhRwF6ArXi4XnQ+REnoTfM5Fk
 VmVmSQ3yFKKePEzoIriT1b2sXO0g5QXOAvFqB65LZjXG9jGJoVG6ZJrUV1MVK8vamKoVbUEe
 0NlLl/tX96HLowHHoKhxEsbFzGzKiFLh7hyboTpy2whdonkDxpnv/H8wE9M3VW/fPgnL2nPe
 xaBLqyHxy9hA9JrZvxg3IQ61x7rtBWBUQPmEaK0azW+l3ysiNpBhISkZrsW3ZUdknWu87nh6
 eTB7mR7xBcVxnomxWwJI4B0wuMwCPdgbV6YDUKCuSgRMUEiVry10xd9KLypR9Vfyn1AhROrq
 AubRPVeJBf9zR5UW1trJNfwVt3XmbHX50HCcHdEdCKiT9O+FiEcahIaWh9lihvO0ci0TtVGZ
 MCEtaCE80Q3Ma9RdHYB3uVF930jwquplFLNF+IBCn5JRzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmA872oFCRRflLYACgkQG5NDfTtBYpvScw/9GrqBrVLuJoJ52qBBKUBDo4E+5fU1bjt0
 Gv0nh/hNJuecuRY6aemU6HOPNc2t8QHMSvwbSF+Vp9ZkOvrM36yUOufctoqON+wXrliEY0J4
 ksR89ZILRRAold9Mh0YDqEJc1HmuxYLJ7lnbLYH1oui8bLbMBM8S2Uo9RKqV2GROLi44enVt
 vdrDvo+CxKj2K+d4cleCNiz5qbTxPUW/cgkwG0lJc4I4sso7l4XMDKn95c7JtNsuzqKvhEVS
 oic5by3fbUnuI0cemeizF4QdtX2uQxrP7RwHFBd+YUia7zCcz0//rv6FZmAxWZGy5arNl6Vm
 lQqNo7/Poh8WWfRS+xegBxc6hBXahpyUKphAKYkah+m+I0QToCfnGKnPqyYIMDEHCS/RfqA5
 t8F+O56+oyLBAeWX7XcmyM6TGeVfb+OZVMJnZzK0s2VYAuI0Rl87FBFYgULdgqKV7R7WHzwD
 uZwJCLykjad45hsWcOGk3OcaAGQS6NDlfhM6O9aYNwGL6tGt/6BkRikNOs7VDEa4/HlbaSJo
 7FgndGw1kWmkeL6oQh7wBvYll2buKod4qYntmNKEicoHGU+x91Gcan8mCoqhJkbqrL7+nXG2
 5Q/GS5M9RFWS+nYyJh+c3OcfKqVcZQNANItt7+ULzdNJuhvTRRdC3g9hmCEuNSr+CLMdnRBY fv0=
In-Reply-To: <4fe9f898-63bf-4815-a493-23bdee93481e@quicinc.com>
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

On 08/04/2025 15:23, Mukesh Kumar Savaliya wrote:
>>> +
>>> +static int i3c_geni_runtime_get_mutex_lock(struct geni_i3c_dev *gi3c)
>>> +{
>>
>> You miss sparse/lockdep annotations.
>>
> This is called in pair only, but to avoid repeated code in caller 
> functions, we have designed this wrapper.
> i3c_geni_runtime_get_mutex_lock()
> i3c_geni_runtime_put_mutex_unlock().
> 
> caller function maintains the parity. e.g. geni_i3c_master_priv_xfers().
> 
> Does a comment help here ? Then i can write up to add.

I do not see how this is relevant to my comment at all.

> 
>>> +	int ret;
>>> +
>>> +	mutex_lock(&gi3c->lock);
>>> +	reinit_completion(&gi3c->done);
>>> +	ret = pm_runtime_get_sync(gi3c->se.dev);
>>> +	if (ret < 0) {
>>> +		dev_err(gi3c->se.dev, "error turning on SE resources:%d\n", ret);
>>> +		pm_runtime_put_noidle(gi3c->se.dev);
>>> +		/* Set device in suspended since resume failed */
>>> +		pm_runtime_set_suspended(gi3c->se.dev);
>>> +		mutex_unlock(&gi3c->lock);
>>
>> Either you lock or don't lock, don't mix these up.
>>
> Caller is taking care of not calling i3c_geni_runtime_put_mutex_unlock() 
> if this failed.


I do not see how this is relevant to my comment at all.

>>> +		return ret;
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static void i3c_geni_runtime_put_mutex_unlock(struct geni_i3c_dev *gi3c)
>>> +{
>>
>> Missing annotations.
>>
> Shall i add a comment here ?

Do you understand what is sparse? And lockdep?

>>> +	pm_runtime_mark_last_busy(gi3c->se.dev);
>>> +	pm_runtime_put_autosuspend(gi3c->se.dev);
>>> +	mutex_unlock(&gi3c->lock);
>>> +}
>>> +
>>> +static void geni_i3c_abort_xfer(struct geni_i3c_dev *gi3c)
>>> +{
>>> +	unsigned long time_remaining;
>>> +	unsigned long flags;
>>> +
>>> +	reinit_completion(&gi3c->done);
>>> +	spin_lock_irqsave(&gi3c->irq_lock, flags);
>>> +	geni_i3c_handle_err(gi3c, GENI_TIMEOUT);
>>> +	geni_se_abort_m_cmd(&gi3c->se);
>>> +	spin_unlock_irqrestore(&gi3c->irq_lock, flags);
>>> +	time_remaining = wait_for_completion_timeout(&gi3c->done, XFER_TIMEOUT);
>>> +	if (!time_remaining)
>>> +		dev_err(gi3c->se.dev, "Timeout abort_m_cmd\n");
>>> +}
>>
>> ...
>>
>>> +
>>> +static int i3c_geni_resources_init(struct geni_i3c_dev *gi3c, struct platform_device *pdev)
>>> +{
>>> +	int ret;
>>> +
>>> +	gi3c->se.base = devm_platform_ioremap_resource(pdev, 0);
>>> +	if (IS_ERR(gi3c->se.base))
>>> +		return PTR_ERR(gi3c->se.base);
>>> +
>>> +	gi3c->se.clk = devm_clk_get(&pdev->dev, "se");
>>> +	if (IS_ERR(gi3c->se.clk))
>>> +		return dev_err_probe(&pdev->dev, PTR_ERR(gi3c->se.clk),
>>> +							"Unable to get serial engine core clock: %pe\n",
>>> +							gi3c->se.clk);
>>
>> Totally messed indentation.
>>
> yes, corrected.
>>> +	ret = geni_icc_get(&gi3c->se, NULL);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	/* Set the bus quota to a reasonable value for register access */
>>> +	gi3c->se.icc_paths[GENI_TO_CORE].avg_bw = GENI_DEFAULT_BW;
>>> +	gi3c->se.icc_paths[CPU_TO_GENI].avg_bw = GENI_DEFAULT_BW;
>>> +	ret = geni_icc_set_bw(&gi3c->se);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	/* Default source clock (se-clock-frequency) freq is 100Mhz */
>>> +	gi3c->clk_src_freq = KHZ(100000);
>>
>> And why can't you use clk_get_rate()?
>>
> During probe(), we need one time initialization of source clock 
> frequencey. HW has no clock set before this.

How is it possible that there is no clock or clock was not configured
but you need to know it? Anyway, it's tiring to keep discussing this.

>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int geni_i3c_probe(struct platform_device *pdev)
>>> +{
>>> +	u32 proto, tx_depth, fifo_disable;
>>> +	struct geni_i3c_dev *gi3c;
>>
>> Just store pdev->dev in local dev variable, to simplify everything here.
> yes, thats right. But i see other drivers are using same pdev->dev. Is 
> it fine ? if really required, will change it.

Are you going to discuss every little comment? And come with arguments
like "I found poor code, so I am allowed to do the same"?

Best regards,
Krzysztof

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
